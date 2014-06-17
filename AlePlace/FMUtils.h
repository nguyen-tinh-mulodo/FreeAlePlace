//
//  FMUtils.h
//  FreeMarket
//
//  Created by nguyenkhoi on 9/6/13.
//  Copyright (c) 2013 Nguyen Huu Tinh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FMUtils : NSObject


+ (CGFloat)heightForCell:(NSString *)text size:(float)size font:(NSString *)font width:(float)width;
+ (UIView *)getMainView;
+ (UIBarButtonItem *)backArrowButtonWithTarget:(id)target action:(SEL)action;
+ (UIBarButtonItem *)moreArrowButtonWithTarget:(id)target action:(SEL)action;
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;
+(NSString *)timeToDate:(NSString *)time;
+ (BOOL)isIPhone5;
@end
