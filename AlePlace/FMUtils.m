//
//  FMUtils.m
//  FreeMarket
//
//  Created by nguyenkhoi on 9/6/13.
//  Copyright (c) 2013 Nguyen Huu Tinh. All rights reserved.
//

#import "FMUtils.h"
#import <sys/utsname.h>
#import "APAppDelegate.h"


@implementation FMUtils


+ (CGFloat)heightForCell:(NSString *)text size:(float)size font:(NSString *)font width:(float)width{
    CGSize sizeToFit = [text sizeWithFont:[UIFont fontWithName:font size:size] constrainedToSize:CGSizeMake(width, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
    
    return fmaxf(50.0f, sizeToFit.height + 50 );
}
+ (UIView *)getMainView {
    return [[APAppDelegate appDelegate] window];
}
+ (UIBarButtonItem *)backArrowButtonWithTarget:(id)target action:(SEL)action
{
    UIImage *buttonImage = [UIImage imageNamed:@"Back-button-.png"];
    //create the button and assign the image
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:buttonImage forState:UIControlStateNormal];
    //set the frame of the button to the size of the image (see note below)
    [button setContentMode:UIViewContentModeScaleAspectFit];
    button.frame = CGRectMake(0, 0,0,0);
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    //create a UIBarButtonItem with the button as a custom view
    UIBarButtonItem *customBarItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    return customBarItem;
}
+ (UIBarButtonItem *)moreArrowButtonWithTarget:(id)target action:(SEL)action
{
    UIImage *buttonImage = [UIImage imageNamed:@"More.png"];
    //create the button and assign the image
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:buttonImage forState:UIControlStateNormal];
    //set the frame of the button to the size of the image (see note below)
    [button setContentMode:UIViewContentModeScaleAspectFit];
    button.frame = CGRectMake(0, 0,60,30);
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    //create a UIBarButtonItem with the button as a custom view
    UIBarButtonItem *customBarItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    return customBarItem;
}
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
+(NSString *)timeToDate:(NSString *)time{
        NSTimeInterval _interval=[time doubleValue];
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:_interval];
        NSDateFormatter *dateF=[[NSDateFormatter alloc] init];
       [dateF setDateFormat:@"dd/MM/yyyy"];
        NSString *dateStr=[dateF stringFromDate:date];
    return dateStr;
}
+ (BOOL)isIPhone5 {
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    if ([UIScreen mainScreen].scale == 2.f && screenHeight == 568.0f) {
        return YES;
    }
    return NO;
}
@end
