//
//  AppView.m
//  AirResistance
//
//  Created by Jules on 3/28/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "AppView.h"
#import "AppDelegate.h"
#import "RectangleShape.h"

@implementation AppView
@synthesize shapesMut;
@synthesize slide1;
@synthesize slide2;
@synthesize slide3;
@synthesize slide4;

//moved "shapesMut" to .h file
double framerate;       // The number of seconds/frame
int windowWidth;        // Width of main window - not utilized
int windowHeight;       // Height of main window - not utilized

BOOL layoutSwitch;


// Initiate all parameters
- (id)initWithFr:(CGRect)frame:(double)fr {
    self = [super initWithFrame:frame];
    if (self) {
        framerate = fr;
        numberShapes = 4;
        
        layoutSwitch = true;
        
        //-(id) init: (double) xx: (double) xy: (double) vx: (double) vy: (double) ax: (double) ay: (double) dx: (double) dy: (BOOL) m: (double) w: (double) h {
        shapesMut = [NSMutableArray array];
		
		[self reset];
		windowWidth = frame.size.width;
		windowHeight = frame.size.height;   
        
    }
    return self;
}


// Main drawing functions - calls other drawers
-(void)drawRect:(NSRect)dirtyRect {    
    [self setDrag];
    
    for (int i=0; i<[shapesMut count]; i++) {        
        [[shapesMut objectAtIndex:i] update];
            
        [[shapesMut objectAtIndex:i] draw:[NSColor blueColor]];
        
        //[self setNeedsDisplayInRect:CGRectMake([[shapesMut objectAtIndex:i] getX], [[shapesMut objectAtIndex:i] getY], [[shapesMut objectAtIndex:i] getX]+[[shapesMut objectAtIndex:i] getWidth], [[shapesMut objectAtIndex:i] getY]+[[shapesMut objectAtIndex:i] getHeight])];

    }
}

-(void) drawRect2: (NSRect)dirtyRect {    
    NSLog(@"Draw");
    
    [self setDrag];
    
    for (int i=0; i<[shapesMut count]; i++) {
        [[shapesMut objectAtIndex:i] update];
        
        [[shapesMut objectAtIndex:i] draw:[NSColor blueColor]];
    }
    
    
}

-(void) setDrag { 
    [[shapesMut objectAtIndex:0] setDrag:slide1];
    [[shapesMut objectAtIndex:1] setDrag:slide2];
    [[shapesMut objectAtIndex:2] setDrag:slide3];
    [[shapesMut objectAtIndex:3] setDrag:slide4];
}

+(int) getWidth { return windowWidth; }
+(int) getHeight { return windowHeight; }

-(void)reset{
	[shapesMut removeAllObjects];
	
    if (layoutSwitch == true)
        [self setSpread];
    else
        [self setOverlap];
}

-(void) changeLayout {
    [shapesMut removeAllObjects];
	
    if (layoutSwitch == true)
        [self setOverlap];
    else
        [self setSpread];
    
    layoutSwitch ^= 1;
}

-(void) setSpread {
    [shapesMut addObject:[[RectangleShape alloc] init:100:400:20:0:0:0:0.1:0.1:1:15:20:[NSColor blueColor]]];
    [shapesMut addObject:[[RectangleShape alloc] init:250:400:20:0:0:0:0.2:0.2:1:15:20:[NSColor greenColor]]];
    [shapesMut addObject:[[RectangleShape alloc] init:400:400:20:0:0:0:0.3:0.3:1:15:20:[NSColor orangeColor]]];
    [shapesMut addObject:[[RectangleShape alloc] init:550:400:20:0:0:0:0.4:0.4:1:15:20:[NSColor redColor]]];
}

-(void) setOverlap {
    [shapesMut addObject:[[RectangleShape alloc] init:100:400:20:0:0:0:0.1:0.1:1:15:20:[NSColor blueColor]]];
    [shapesMut addObject:[[RectangleShape alloc] init:100:400:20:0:0:0:0.2:0.2:1:15:20:[NSColor greenColor]]];
    [shapesMut addObject:[[RectangleShape alloc] init:100:400:20:0:0:0:0.3:0.3:1:15:20:[NSColor orangeColor]]];
    [shapesMut addObject:[[RectangleShape alloc] init:100:400:20:0:0:0:0.4:0.4:1:15:20:[NSColor redColor]]];
}

@end
