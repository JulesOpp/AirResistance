//
//  RectangleShape.m
//  Physics Engine
//
//  Created by Jules on 12/27/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "RectangleShape.h"
#import "AppView.h"
#import "AppDelegate.h"

@implementation RectangleShape
@synthesize bouncez;

// The posX and posY define the bottom left corner of the rectangle
// All else needed is the width and height

-(id) init: (double) xx: (double) xy: (double) vx: (double) vy: (double) ax: (double) ay: (double) dx: (double) dy: (BOOL) m: (double) w: (double) h: (NSColor*) c {
    self = [super init];
    if (self) {
        width = w;
        height = h;
        posX = xx;
        posY = xy;
        velX = vx;
        velY = vy;
        accX = ax;
        accY = ay;
        dragX = dx;
        dragY = dy;
        mass = m;
        col = c;
    }
    return self;
}

-(void) draw:(NSColor*)c {  
    [col setFill];
    NSRectFill(CGRectMake(posX, posY, width, height));
}

// For a step by step calculation
// Xf = Xo + V
// Vf = Vo + A
// A = F/m    assuming m=1    Ay = g - dv  and   Ax = -dv

-(void) update {
    double fr = [AppDelegate getFrameRate]; 
    
    double gravity = -4;
    
    // Ax = (ma - dv)/m      Ay = (ma - mg - dv)/m
    double currentAccX = (mass*accX-dragX*velX)/mass;
    double currentAccY = (mass*accY+mass*gravity-dragY*velY)/mass;
    
    velX += currentAccX*fr*10;
    velY += currentAccY*fr*10;
    
    posX += velX*fr*10;
    posY += velY*fr*10;
	

    // Bounce
    if (posY < 0 && velY < 0)
        velY *= -1;
    if (posX < 0 && velX < 0)
        velX *= -1;
    if (posY > [AppView getHeight] && velY > 0)
        velY *= -1;
    if (posX > [AppView getWidth] && velX > 0)
        velX *= -1;
    
    // Keep at bottom
	if (bouncez == NO) {
		if (posY <= 0) {
			posY = 0;
			velY = 0;
		}
	}
}

-(double) getWidth { return width; }
-(double) getHeight { return height; }
-(NSColor*) getColor { return col; }
-(void) setDrag:(int)d { dragX = d/100.0; dragY = d/100.0; }

@end
