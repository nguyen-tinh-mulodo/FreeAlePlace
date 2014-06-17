//
//  APMyAnnotation.m
//  AlePlace
//
//  Created by VinhPhuc on 6/9/14.
//
//

#import "APMyAnnotation.h"

@implementation MyAnnotation

@synthesize coordinate;

@synthesize title;

@synthesize time;

@synthesize subTitle;

-(id)initWithCoordinate:(CLLocationCoordinate2D) c title:(NSString *) t subTitle:(NSString *)timed time:(NSString *)tim

{
    
    self.coordinate=c;
    
    self.time=tim;
    
    self.subTitle=timed;
    
    self.title=t;
    
    return self;
    
}

-(id)initWithCoordinate:(CLLocationCoordinate2D) c title:(NSString *)tit

{
    
    self.coordinate=c;
    
    self.title=tit;
    
    return self;
    
}

@end