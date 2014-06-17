//
//  APMyAnnotation.h
//  AlePlace
//
//  Created by VinhPhuc on 6/9/14.
//
//

#import <Foundation/Foundation.h>

#import "MapAnnotation.h"

@interface MyAnnotation : NSObject

{
    
    CLLocationCoordinate2D coordinate;
    
    NSString *title;
    
    NSString *subTitle;
    
    NSString *time;
    
}

@property (nonatomic)CLLocationCoordinate2D coordinate;

@property (nonatomic, retain) NSString *title;

@property (nonatomic, retain) NSString *subTitle;

@property (nonatomic,retain) NSString *time;

-(id)initWithCoordinate:(CLLocationCoordinate2D) c title:(NSString *) t subTitle:(NSString *)timed time:(NSString *)tim;

-(id)initWithCoordinate:(CLLocationCoordinate2D) c title:(NSString *)tit;

@end
