//
//  RectangleShape.h
//  AirResistance
//
//  Created by Jules on 3/28/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RectangleShape : NSObject
{
@private
    double width;
    double height;
    
    double posX;
    double posY;
    double velX;
    double velY;
    double accX;
    double accY;
    
    double dragX;
    double dragY;
    
    double mass;
}

-(id) init: (double) xx: (double) xy: (double) vx: (double) vy: (double) ax: (double) ay: (double) dx: (double) dy: (BOOL) m: (double) w: (double) h;
-(void) draw:(NSColor*)c;
-(void) update;


-(double) getWidth;
-(double) getHeight;
@end
