//
//  FMControllShowFullImage.m
//  FreeMarket
//
//  Created by Mulodo on 12/6/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import "FMControllShowFullImage.h"
#import "AFNetworking.h"
#import "FMConstants.h"
#define kTagImageView   100
#define kTagActivityView   200
@interface UIView (ARES)

- (void)roundCornerShadowAndBorder;

@end

@implementation UIView (ARES)
- (void)roundCornerShadowAndBorder {
    
    [self.layer setCornerRadius:3];
    [self.layer setMasksToBounds:NO];
    [self.layer setShadowColor:[UIColor darkTextColor].CGColor];
    [self.layer setShadowOpacity:0.6];
    [self.layer setShadowOffset:CGSizeMake(1,1)];
    [self.layer setShadowRadius:0.9];
    [self.layer setShadowPath:[[UIBezierPath bezierPathWithRoundedRect:self.layer.bounds cornerRadius:self.layer.cornerRadius] CGPath]];
    
    [self.layer setShouldRasterize:YES];
    [self.layer setRasterizationScale:[UIScreen mainScreen].scale];
    
}

@end
@implementation FMControllShowFullImage{
    UIButton *buttonCancel;
    
}
@synthesize delegate;
@synthesize scrollView = _scrollView;
@synthesize pageControl = _pageControl;
@synthesize pageImages = _pageImages;
@synthesize pageViews = _pageViews;

- (id)initWithFrame:(CGRect)frame pages:(NSArray*)pagesArray pageSet:(int)pageSet
{
    //self = [super initWithFrame:frame];
    self.view.backgroundColor = [UIColor blackColor];
    //Create pages
    self.pageImages = [[NSArray alloc] init];
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height)];
    _scrollView.backgroundColor = [UIColor blackColor];
    _scrollView.pagingEnabled = YES;
    [_scrollView setShowsHorizontalScrollIndicator:NO];
    [_scrollView setShowsVerticalScrollIndicator:NO];
    _scrollView.maximumZoomScale = 2.0;
    _scrollView.minimumZoomScale = 0.5;
    [_scrollView setZoomScale:_scrollView.minimumZoomScale];

    _scrollView.delegate =self;
    [self.view addSubview:_scrollView];
    self.pageImages = pagesArray;
    NSInteger pageCount = self.pageImages.count;
    
    // Set up the page control
    if ([pagesArray count] > 1) {
        pageControl = [[UIPageControl alloc] init];
        pageControl.currentPage = pageSet;
        pageControl.numberOfPages = pageCount;
        [pageControl sizeToFit];
        [pageControl setCenter:CGPointMake([FMUtils getMainView].frame.size.width/2.0, [FMUtils getMainView].frame.size.height-20)];
        [self.view addSubview:pageControl];
        [pageControl setEnabled:NO];
    }
    
    // Set up the array to hold the views for each page
    self.pageViews = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < pageCount; ++i) {
        [self.pageViews addObject:[NSNull null]];
    }
    // Set up the content size of the scroll view
    CGSize pagesScrollViewSize = _scrollView.frame.size;
    _scrollView.contentSize = CGSizeMake(pagesScrollViewSize.width * self.pageImages.count, pagesScrollViewSize.height);
    [_scrollView setContentOffset:CGPointMake(pageSet* frame.size.width,0) animated:NO];
    _indexImage = pageSet;
    // Load the initial set of pages that are on screen
    [self loadVisiblePages:pageSet];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 7)
        {
            buttonCancel = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width-75 , 20 , 50, 25)];

        }
    else
        {
            buttonCancel = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width-75 , 25 , 50, 25)];

            
        }
    
    [buttonCancel setTitle:@"done" forState:UIControlStateNormal];
    [buttonCancel.titleLabel setFont:[UIFont fontWithName:@"Roboto-Regular" size:kFontSize14]];
    [buttonCancel.layer setBorderColor:[UIColor whiteColor].CGColor];
    [buttonCancel.layer setBorderWidth:1];
    [buttonCancel.layer setShadowRadius:2];
    
    [buttonCancel.layer setShouldRasterize:YES];
    [buttonCancel roundCornerShadowAndBorder];
    [buttonCancel addTarget:self action:@selector(removeSelfView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonCancel];

    

    return self;
}





#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // Load the pages which are now on screen
    [self loadVisiblePages:6];
    if (!_flagRotating) {
        CGFloat pageWidth = _scrollView.bounds.size.width;
        float fractionalPage = _scrollView.contentOffset.x / pageWidth;
        _indexImage = lround(fractionalPage);
    }
    
}


-(IBAction)hiddenNavigationBar:(UIGestureRecognizer *)recognizer{
    [UIView animateWithDuration:0.5 animations:^{
        if (buttonCancel.hidden) {
            buttonCancel.hidden = NO;
        }else{
            buttonCancel.hidden = YES;
        }
    }];
}
-(void)removeSelfView{
    [self.delegate navigationBarHidden];
    /*[UIView animateWithDuration:0.5 animations:^{
        [self removeFromSuperview];
    }];*/
     [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
     [self.navigationController setNavigationBarHidden:NO animated:YES];
     [super dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -

- (void)loadVisiblePages:(int)pageSet {
    // First, determine which page is currently visible
    CGFloat pageWidth = _scrollView.frame.size.width;
    NSInteger page = (NSInteger)floor((_scrollView.contentOffset.x * 2.0f + pageWidth) / (pageWidth * 2.0f));

    pageControl.currentPage = page;
    
    // Work out which pages we want to load
    NSInteger firstPage = page - 1;
    NSInteger lastPage = page + 1;
    
    // Purge anything before the first page
    /*for (NSInteger i=0; i<firstPage; i++) {
        [self purgePage:i];
    }*/
    for (NSInteger i=firstPage; i<=lastPage; i++) {
        [self loadPage:i];
    }
    /*for (NSInteger i=lastPage+1; i<self.pageImages.count; i++) {
        [self purgePage:i];
    }*/
}

- (void)loadPage:(NSInteger)page {
    @try {
        if (page < 0 || page >= self.pageImages.count || page >= self.pageViews.count) {
            return;
        }
        
        pageView = [self.pageViews objectAtIndex:page];
        if ((NSNull*)pageView == [NSNull null]) {
            CGRect frame = _scrollView.bounds;
            frame.origin.x = frame.size.width * page;
            frame.origin.y = 0.0f;
            UIImageView *imagePageView;
            imagePageView =[[UIImageView alloc] init];
            [imagePageView setTag:page + kTagImageView];
            NSString * url=[NSString stringWithFormat:@"%@", [self.pageImages objectAtIndex:page]];
            NSURLRequest *requestImage = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
            UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
           activityIndicatorView.center = self.view.center;
            activityIndicatorView.tag = page + kTagActivityView;
            [imagePageView addSubview:activityIndicatorView];
            activityIndicatorView.hidesWhenStopped=YES;

            [activityIndicatorView startAnimating];
            
            id iView = imagePageView;

            [imagePageView setImageWithURLRequest:requestImage
                             placeholderImage:nil
                                      success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                          [activityIndicatorView stopAnimating];
                                          [activityIndicatorView removeFromSuperview];
                                        
                                          [iView setImage:image];

                                      }
                                      failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
                                          [activityIndicatorView removeFromSuperview];
                                          
                                      }];

            imagePageView.contentMode = UIViewContentModeScaleAspectFit;
            [imagePageView setAutoresizingMask:_scrollView.autoresizingMask];
           imagePageView.frame = frame;
            [_scrollView addSubview:imagePageView];
            [self.pageViews replaceObjectAtIndex:page withObject:imagePageView];
        }
    }
    @catch (NSException *exception) {
    }
    @finally {
        
    }
    
}

/*- (void)purgePage:(NSInteger)page {
    @try {
        if (page < 0 || page >= self.pageImages.count || page >= self.pageViews.count) {
            return;
        }
       pageView = [self.pageViews objectAtIndex:page];
        if ((NSNull*)pageView != [NSNull null]) {
            [pageView removeFromSuperview];
            [self.pageViews replaceObjectAtIndex:page withObject:[NSNull null]];
        }
    }
    @catch (NSException *exception) {
        DEBUG_LOG(@"purgePage:%@",exception);
    }
    @finally {
        
    }
    
}*/
#pragma mark - Rotate View Support
- (BOOL)shouldAutorotate {
    return YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    _flagRotating = NO;
}
- (NSUInteger)supportedInterfaceOrientations
{
    //return orientations you want to support
    return (UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight | UIInterfaceOrientationMaskPortraitUpsideDown);
}
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    NSInteger numberOfPages = [self.pageViews count];
    _flagRotating =YES;
    switch (toInterfaceOrientation) {
        case UIInterfaceOrientationPortrait: {
            
             _scrollView.frame = CGRectMake(0, 0, [FMUtils getMainView].frame.size.width, [FMUtils getMainView].frame.size.height);
            
            if ([[[UIDevice currentDevice] systemVersion] floatValue] < 7)
            {
                buttonCancel.frame = CGRectMake(self.view.frame.size.width-75 , 20 , 50, 25);
                [pageControl setCenter:CGPointMake(self.view.frame.size.width/2 + (IS_IPAD?120:120), self.view.frame.size.height-20)];
            }
            else
            {
                buttonCancel.frame = CGRectMake(self.view.frame.size.width-75 , 25 , 50, 25);
                
                 [pageControl setCenter:CGPointMake(self.view.frame.size.width/2 + (IS_IPAD?120:80), self.view.frame.size.height-20)];
            }
            
            [UIView animateWithDuration:0.1
                             animations:^{
                                 [_scrollView setContentSize:CGSizeMake([FMUtils getMainView].frame.size.width * numberOfPages, [FMUtils getMainView].frame.size.height)];
                                 [_scrollView setContentOffset:CGPointMake([FMUtils getMainView].frame.size.width * _indexImage, _scrollView.contentOffset.y) animated:NO];
                                 for (NSInteger i = 0; i < numberOfPages; i++) {
                                     UIImageView *imgPageView = (UIImageView *)[_scrollView viewWithTag:i + kTagImageView];
                                     CGRect pageFrame = CGRectMake(i * [FMUtils getMainView].frame.size.width, 0.0, _scrollView.bounds.size.width, _scrollView.bounds.size.height);
                                     [imgPageView setFrame:pageFrame];
                                     [(UIActivityIndicatorView *)[imgPageView viewWithTag:i + kTagActivityView] setCenter:CGPointMake([FMUtils getMainView].frame.size.width/2,[FMUtils getMainView].frame.size.height/2)];
                                 }
                             }
                             completion:^(BOOL finished){
                                 
                             }];
            break;
        }
            
        case UIInterfaceOrientationLandscapeLeft: {
            
            
            _scrollView.frame = CGRectMake(0, 0, self.view.frame.size.height, [FMUtils getMainView].frame.size.width);
            if ([[[UIDevice currentDevice] systemVersion] floatValue] < 7)
            {
                buttonCancel.frame = CGRectMake(self.view.frame.size.height-75 , 20 , 50, 25);
                 [pageControl setCenter:CGPointMake(self.view.frame.size.height/2 - (IS_IPAD?120:120), self.view.frame.size.width-20)];
            }
            else
            {
                buttonCancel.frame = CGRectMake(self.view.frame.size.height-75 , 25 , 50, 25);
                 [pageControl setCenter:CGPointMake(self.view.frame.size.height/2 - (IS_IPAD?120:80), self.view.frame.size.width-20)];
                
            }
            
            [UIView animateWithDuration:0.1
                             animations:^{
                                 [_scrollView setContentSize:CGSizeMake([FMUtils getMainView].frame.size.height * numberOfPages, [FMUtils getMainView].frame.size.width)];
                                 [_scrollView setContentOffset:CGPointMake([FMUtils getMainView].frame.size.height * _indexImage, _scrollView.contentOffset.y) animated:NO];
                                 for (NSInteger i = 0; i < numberOfPages; i++) {
                                     UIImageView *imgPageView = (UIImageView *)[_scrollView viewWithTag:i + kTagImageView];
                                     CGRect pageFrame = CGRectMake(i * [FMUtils getMainView].frame.size.height, 0.0, _scrollView.bounds.size.width, _scrollView.bounds.size.height);
                                     [imgPageView setFrame:pageFrame];
                                     [(UIActivityIndicatorView *)[imgPageView viewWithTag:i + kTagActivityView] setCenter:CGPointMake([FMUtils getMainView].frame.size.height/2,[FMUtils getMainView].frame.size.width/2)];
                                 }
                             }
                             completion:^(BOOL finished){
                                 
                             }];
            
            break;
        }
            
        case UIInterfaceOrientationLandscapeRight: {
            
            _scrollView.frame = CGRectMake(0, 0, [FMUtils getMainView].frame.size.height, [FMUtils getMainView].frame.size.width);
            if ([[[UIDevice currentDevice] systemVersion] floatValue] < 7)
            {
                buttonCancel.frame = CGRectMake(self.view.frame.size.height-75 , 20 , 50, 25);
                [pageControl setCenter:CGPointMake(self.view.frame.size.height/2 - (IS_IPAD?120:120), self.view.frame.size.width-20)];
            }
            else
            {
                buttonCancel.frame = CGRectMake(self.view.frame.size.height-75 , 25 , 50, 25);
                
                [pageControl setCenter:CGPointMake(self.view.frame.size.height/2 - (IS_IPAD?120:80), self.view.frame.size.width-20)];
            }
            
            [UIView animateWithDuration:0.1
                             animations:^{
                                 [_scrollView setContentSize:CGSizeMake([FMUtils getMainView].frame.size.height * numberOfPages, [FMUtils getMainView].frame.size.width)];
                                 [_scrollView setContentOffset:CGPointMake([FMUtils getMainView].frame.size.height * _indexImage, _scrollView.contentOffset.y) animated:YES];
                                 for (NSInteger i = 0; i < numberOfPages; i++) {
                                     UIImageView *imgPageView = (UIImageView *)[_scrollView viewWithTag:i + kTagImageView];
                                     CGRect pageFrame = CGRectMake(i * [FMUtils getMainView].frame.size.height, 0.0, _scrollView.bounds.size.width, _scrollView.bounds.size.height);
                                     [imgPageView setFrame:pageFrame];
                                     [(UIActivityIndicatorView *)[imgPageView viewWithTag:i + kTagActivityView] setCenter:CGPointMake([FMUtils getMainView].frame.size.height/2,[FMUtils getMainView].frame.size.width/2)];
                                 }
                             }
                             completion:^(BOOL finished){
                                 
                             }];
            
            break;
        }
            
        default:
            break;
    }
}

@end
