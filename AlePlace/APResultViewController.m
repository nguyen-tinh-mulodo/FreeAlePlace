//
//  APResultViewController.m
//  AlePlace
//
//  Created by Apple on 6/9/14.
//
//

#import "APResultViewController.h"
#import "FMConstants.h"
@interface APResultViewController ()

@end

@implementation APResultViewController
@synthesize webView,result;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL *urlforWebView=[NSURL URLWithString:result];
    NSURLRequest *urlRequest=[NSURLRequest requestWithURL:urlforWebView];
    self.webView.frame = CGRectMake(self.webView.frame.origin.x, self.webView.frame.origin.y, self.webView.frame.size.width, self.webView.frame.size.height+ 50);
    [self.webView loadRequest:urlRequest];
    // Do any additional setup after loading the view from its nib.
    [[NSNotificationCenter defaultCenter]postNotificationName:kAleViewController object:self userInfo:@{kNameView:@"APResultViewController"}];
    // Do any additional setup after loading the view from its nib.

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(removeView) name:kRemoveAPResultViewController object:nil];
}
-(void)removeView{
    [self.view removeFromSuperview];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
