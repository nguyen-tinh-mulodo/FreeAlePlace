//
//  APLaunchImageViewController.m
//  AlePlace
//
//  Created by Apple on 6/5/14.
//
//

#import "APLaunchImageViewController.h"

@interface APLaunchImageViewController ()
{
    NSTimer *test;
}
@end

@implementation APLaunchImageViewController
@synthesize imageLaunch,slider;
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
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7)
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.navigationController.navigationBar.translucent = NO;
    }
    //self.imageLaunch = [[UIImageView alloc] initWithImage:<#(UIImage *)#>]
    // Do any additional setup after loading the view from its nib.
    
    test = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateUI:) userInfo:nil repeats:YES];
}
- (void)updateUI:(NSTimer *)timer
{
    static int count =0; count++;
    
    if (count <=10)
    {
        //self.slider.text = [NSString stringWithFormat:@"%d %%",count*10];
        self.slider.progress = (float)count/10.0f;
    } else
    {
        [test invalidate];
        test = nil;
    } 
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
