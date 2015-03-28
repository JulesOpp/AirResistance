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

//CoreShape *shapes[10];   // Storage of all the shapes
NSMutableArray *shapesMut; 
int numberShapes;       // The number of shapes
double framerate;       // The number of seconds/frame
int windowWidth;        // Width of main window - not utilized
int windowHeight;       // Height of main window - not utilized
BOOL pausePlay;         // Whether paused or play
int currentObject;      // Currently selected object

BOOL isDrawingArrow;    // State of arrow
NSBezierPath * path;    // Arrow
double arrowXi;
double arrowYi;
double arrowXf;
double arrowYf;

// Initiate all parameters
- (id)initWithFr:(CGRect)frame:(double)fr {
    self = [super initWithFrame:frame];
    if (self) {
        framerate = fr;
        numberShapes = 10;
        currentObject = 0;
        isDrawingArrow = false;
        
        //-(id) init: (double) xx: (double) xy: (double) vx: (double) vy: (double) ax: (double) ay: (double) dx: (double) dy: (BOOL) m: (double) w: (double) h {
        shapesMut = [NSMutableArray array];
        [shapesMut addObject:[[RectangleShape alloc] init:100:400:10:0:0:0:0.2:0.2:1:15:20]];
        [shapesMut addObject:[[RectangleShape alloc] init:300:400:10:0:0:0:0.1:0.1:1:15:20]];
        
        windowWidth = frame.size.width;
        windowHeight = frame.size.height;
        pausePlay = false;
    }
    return self;
}


// Main drawing functions - calls other drawers
-(void)drawRect:(NSRect)dirtyRect {
    // Don't update if paused
    
    if (pausePlay)
        for (int i=0; i<[shapesMut count]; i++)
            (i!=currentObject)?[[shapesMut objectAtIndex:i] draw:drawColor]:[[shapesMut objectAtIndex:i] draw:[NSColor blueColor]];
    else
        for (int i=0; i<[shapesMut count]; i++) {
            [[shapesMut objectAtIndex:i] update];
            
            (i!=currentObject)?[[shapesMut objectAtIndex:i] draw:drawColor]:[[shapesMut objectAtIndex:i] draw:[NSColor blueColor]];
            
            /*for (int j=i; j<[shapesMut count]; j++) {
                if (i == j) { }
                else if ([[shapesMut objectAtIndex:i] getType] == 1 && [[shapesMut objectAtIndex:j] getType] == 1)
                    [RectangleShape checkCollisionR:(RectangleShape*)[shapesMut objectAtIndex:i] :(RectangleShape*)[shapesMut objectAtIndex:j]];
                else if ([[shapesMut objectAtIndex:i] getType] == 1 && [[shapesMut objectAtIndex:j] getType] == 2)
                    [RectangleShape checkCollisionC:(RectangleShape*)[shapesMut objectAtIndex:i] :(CircleShape*)[shapesMut objectAtIndex:j]];
                else if ([[shapesMut objectAtIndex:i] getType] == 2 && [[shapesMut objectAtIndex:j] getType] == 1)
                    [RectangleShape checkCollisionC:(RectangleShape*)[shapesMut objectAtIndex:j] :(CircleShape*)[shapesMut objectAtIndex:i]];
                else if ([[shapesMut objectAtIndex:i] getType] == 2 && [[shapesMut objectAtIndex:j] getType] == 2)
                    [CircleShape checkCollisionC:(CircleShape*)[shapesMut objectAtIndex:i] :(CircleShape*)[shapesMut objectAtIndex:j]];
            }*/
        }

    if (isDrawingArrow) {
        NSLog(@"Draw");
        
        path = [NSBezierPath bezierPath];
        [path moveToPoint:CGPointMake(arrowXi, arrowYi)];
        [path lineToPoint:CGPointMake(arrowXf, arrowYf)];
        [path setLineWidth: 4];
        
        [[NSColor whiteColor] set];
        [path fill];
        
        [[NSColor grayColor] set]; 
        [path stroke];
    }
}

// Color management
-(void)setColor:(NSColor *)c { drawColor = c; }

+(int) getWidth { return windowWidth; }
+(int) getHeight { return windowHeight; }



@end
