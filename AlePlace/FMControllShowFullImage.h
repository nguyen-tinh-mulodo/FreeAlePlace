//
//  FMControllShowFullImage.h
//  FreeMarket
//
//  Created by Mulodo on 12/6/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMUtils.h"
@protocol FMControllShowFullImageDelegate <NSObject>
@optional
- (void)navigationBarHidden;

@end
@interface FMControllShowFullImage : UIViewController <UIScrollViewDelegate,UIGestureRecognizerDelegate>
{
    UIScrollView *scrollView;
    UIPageControl *pageControl;
    UIView *pageView;
   __block UIImage *tempImage;
    BOOL    _flagRotating;

    
}
@property (assign, nonatomic) NSInteger indexImage;
@property (nonatomic, strong) NSArray *pageImages;
@property (nonatomic, strong) NSMutableArray *pageViews;

@property (weak,nonatomic) id<FMControllShowFullImageDelegate> delegate;
@property (nonatomic, strong)  UIScrollView *scrollView;
@property (nonatomic, strong)  UIPageControl *pageControl;
- (id)initWithFrame:(CGRect)frame pages:(NSArray*)pagesArray pageSet:(int)pageSet;
- (void)loadVisiblePages:(int)pageSet;
- (void)loadPage:(NSInteger)page;
//- (void)purgePage:(NSInteger)page;
@end
