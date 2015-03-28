//
//  AppView.m
//  AirResistance
//
//  Created by Jules on 3/28/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "AppView.h"
#import "RectangleShape.h"

@implementation AppView
@synthesize shapesMut;

//moved "shapesMut" to .h file
double framerate;       // The number of seconds/frame
int windowWidth;        // Width of main window - not utilized
int windowHeight;       // Height of main window - not utilized

// Initiate all parameters
- (id)initWithFr:(CGRect)frame:(double)fr {
    self = [super initWithFrame:frame];
    if (self) {
        framerate = fr;
        numberShapes = 4;
        
        //-(id) init: (double) xx: (double) xy: (double) vx: (double) vy: (double) ax: (double) ay: (double) dx: (double) dy: (BOOL) m: (double) w: (double) h {
        shapesMut = [NSMutableArray array];
        [shapesMut addObject:[[RectangleShape alloc] init:100:400:10:0:0:0:0.1:0.1:1:15:20:[NSColor blueColor]]];
        [shapesMut addObject:[[RectangleShape alloc] init:250:400:10:0:0:0:0.2:0.2:1:15:20:[NSColor greenColor]]];
        [shapesMut addObject:[[RectangleShape alloc] init:400:400:10:0:0:0:0.3:0.3:1:15:20:[NSColor orangeColor]]];
        [shapesMut addObject:[[RectangleShape alloc] init:550:400:10:0:0:0:0.4:0.4:1:15:20:[NSColor redColor]]];

        windowWidth = frame.size.width;
        windowHeight = frame.size.height;
    }
    return self;
}


// Main drawing functions - calls other drawers
-(void)drawRect:(NSRect)dirtyRect {
    
    for (int i=0; i<[shapesMut count]; i++) {
        [[shapesMut objectAtIndex:i] update];
            
        [[shapesMut objectAtIndex:i] draw:[NSColor blueColor]];
    }
}

+(int) getWidth { return windowWidth; }
+(int) getHeight { return windowHeight; }



@end
