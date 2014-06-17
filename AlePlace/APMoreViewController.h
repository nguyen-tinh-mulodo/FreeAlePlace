//
//  APMoreViewController.h
//  AlePlace
//
//  Created by Apple on 6/9/14.
//
//

#import <UIKit/UIKit.h>
#import "TTTAttributedLabel.h"
@interface APMoreViewController : UIViewController<TTTAttributedLabelDelegate>
@property(nonatomic,strong) TTTAttributedLabel *aboud;
@property(nonatomic,strong) TTTAttributedLabel *contact;
@property(nonatomic,strong) TTTAttributedLabel *vote;
@property(nonatomic,strong) UIImageView *image;
@property(nonatomic,strong) UILabel *nameApp;
@end
