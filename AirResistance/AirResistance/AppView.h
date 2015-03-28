//
//  AppView.h
//  AirResistance
//
//  Created by Jules on 3/28/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppView : NSView
{
@public
    int numberShapes;
	
    
@private
}

@property (nonatomic,readwrite) NSMutableArray *shapesMut; // Storate of all the shapes
- (id)initWithFr:(CGRect)frame:(double)fr;

@property (nonatomic) int slide1;
@property (nonatomic) int slide2;
@property (nonatomic) int slide3;
@property (nonatomic) int slide4;


+(int) getWidth;
+(int) getHeight;
-(void)reset;
-(void) changeLayout;
@end
