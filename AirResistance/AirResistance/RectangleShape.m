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

// The posX and posY define the bottom left corner of the rectangle
// All else needed is the width and height

-(id) init: (double) xx: (double) xy: (double) vx: (double) vy: (double) ax: (double) ay: (double) dx: (double) dy: (BOOL) m: (double) w: (double) h {
    self = [super init];
	//self = [super initWithpositionX:xx positionY:xy velocityX:vx velocityY:vy accelerationX:ax accelerationY:ay dragValueX:dx dragValueY:dy elasticity:e mass:n canMove:m rotation:r rotAccel:ra];
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
    }
    return self;
}

-(void) draw:(NSColor*)c {    
    NSRectFill(CGRectMake(posX, posY, width, height));
}

// For a step by step calculation
// Xf = Xo + V
// Vf = Vo + A
// A = F/m    assuming m=1    Ay = g - dv  and   Ax = -dv

// THE INPUTTED ACCELERATION DOESNT DO ANYTHING RIGHT NOW

-(void) update {
    double fr = [AppDelegate getFrameRate]; 
    
    double gravity = -2;
    //[super setAccX:([super getAccX]-[super getDragX]*[super getVelX])];
    //[super setAccY:([super getAccY]+gravity-[super getDragY]*[super getVelY])];
    
    // Ax = (ma - dv)/m      Ay = (ma - mg - dv)/m
    double currentAccX = (mass*accX-dragX*velX)/mass;
    double currentAccY = (mass*accY+mass*gravity-dragY*velY)/mass;
    
    velX += currentAccX*fr*10;
    velY += currentAccY*fr*10;
    
    posX += velX*fr*10;
    posY += velY*fr*10;
    
    // Bounce
    /*if ([super getPosY] < 0 && [super getVelY] < 0)
        [super setVelY:-1*[super getVelY]];
    if ([super getPosX] < 0 && [super getVelX] < 0)
        [super setVelX:-1*[super getVelX]];
    if ([super getPosY] > [AppView getHeight] && [super getVelY] > 0)
        [super setVelY:-1*[super getVelY]];
    if ([super getPosX] > [AppView getWidth] && [super getVelX] > 0)
        [super setVelX:-1*[super getVelX]];
     */
    
    // Keep at bottom
    if (posY <= 0) {
        posY = 0;
        velY = 0;
    }
}

-(double) getWidth { return width; }
-(double) getHeight { return height; }

@end
