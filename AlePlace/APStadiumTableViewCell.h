//
//  APStadiumTableViewCell.h
//  AlePlace
//
//  Created by Apple on 6/7/14.
//
//

#import <UIKit/UIKit.h>
@protocol APStadiumTableViewCellDelegate <NSObject>
@optional
- (void)showMap:(int)tapCell;


@end
@interface APStadiumTableViewCell : UITableViewCell
@property(nonatomic,weak)IBOutlet UIImageView *imageStadium;
@property(nonatomic,weak)IBOutlet UILabel *titileStadium;
@property(nonatomic,weak)IBOutlet UILabel *city;
@property(nonatomic,weak)IBOutlet UILabel *country;
@property(nonatomic,weak)IBOutlet UILabel *add;
@property(nonatomic,weak)IBOutlet UIButton *btMap;
@property(nonatomic,weak)IBOutlet UIButton *btPreview;
@property(nonatomic,retain) NSString *fromView;

@property(nonatomic,weak)IBOutlet UILabel *countryTitle;
@property(nonatomic,weak)IBOutlet UILabel *cityTitle;
@property(nonatomic,weak)IBOutlet UILabel *addTitle;



@property (weak,nonatomic) id<APStadiumTableViewCellDelegate> delegate;
-(IBAction)showFullMap:(id)sender;
@end
