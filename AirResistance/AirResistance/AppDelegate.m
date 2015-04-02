//
//  AppDelegate.m
//  AirResistance
//
//  Created by Jules on 3/28/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "AppView.h"

#import "RectangleShape.h"
@implementation AppDelegate

@synthesize window = _window; // The main window

NSTimer *timer; // Timer running telling the engine to update
AppView *view; // Reference to the AppView
double frameRate; // The frameRate is what the timer is based upon
bool isBounceable;// whether or not the rectangles can bounce
bool isLayer;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    frameRate = 0.01;
	
	isBounceable = NO;
    isLayer = NO;
	
    // Create the main window
    [self.window setFrame:CGRectMake(300, 200, 750, 500) display:YES];
    [self.window setStyleMask:[self.window styleMask] & ~NSResizableWindowMask];
    view = [[AppView alloc] initWithFr:_window.frame:frameRate];
    [view setFrameOrigin:NSMakePoint(0, 0)];
    [self.window.contentView addSubview:view];
    
    // Set the timer
    timer = [NSTimer scheduledTimerWithTimeInterval:frameRate target:self selector:@selector(refresh:) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
	
    // SLIDERS
	slide1 = [[NSSlider alloc] init];
	slide1.frame = CGRectMake(100, 450, 80, 30);
    [slide1 setMinValue:0];
    [slide1 setMaxValue:100];
    [slide1 setIntValue:0];
	[self.window.contentView addSubview:slide1];
	
	slide2 = [[NSSlider alloc] init];
	slide2.frame = CGRectMake(250, 450, 80, 30);
    [slide2 setMinValue:0];
    [slide2 setMaxValue:100];
    [slide2 setIntValue:20];
	[self.window.contentView addSubview:slide2];
    
    slide3 = [[NSSlider alloc] init];
    slide3.frame = CGRectMake(400, 450, 80, 30);
    [slide3 setMinValue:0];
    [slide3 setMaxValue:100];
    [slide3 setIntValue:40];
    [self.window.contentView addSubview:slide3];
    
    slide4 = [[NSSlider alloc] init];
    slide4.frame = CGRectMake(550, 450, 80, 30);
    [slide4 setMinValue:0];
    [slide4 setMaxValue:100];
    [slide4 setIntValue:60];
    [self.window.contentView addSubview:slide4];

    // BUTT-ONS
	bounceButton = [[NSButton alloc]initWithFrame:CGRectMake(self.window.frame.size.width-80, self.window.frame.size.height-80, 70, 70)];
	[bounceButton setAction:@selector(togglebounce:)];
    [bounceButton setTitle:@"Bounce\nOFF"];
	[self.window.contentView addSubview:bounceButton];


	reset = [[NSButton alloc]initWithFrame:CGRectMake(20, self.window.frame.size.height-80, 70, 70)];
	[reset setAction:@selector(reset)];
	[reset setTitle:@"Reset"];
	[self.window.contentView addSubview:reset];
    
    layout = [[NSButton alloc] initWithFrame:CGRectMake(20, self.window.frame.size.height-150, 70, 70)];
    [layout setAction:@selector(changeLayout:)];
    [layout setTitle:@"Change\nLayout"];
    [self.window.contentView addSubview:layout];
    
    layer = [[NSButton alloc] initWithFrame:CGRectMake(20, self.window.frame.size.height-220, 70, 70)];
    [layer setAction:@selector(layer:)];
    [layer setTitle:@"Layer"];
    [self.window.contentView addSubview:layer];

}

-(IBAction)layer:(id)sender {
    if (isLayer == NO) {
        [timer invalidate];
        timer = nil;
        timer = [NSTimer scheduledTimerWithTimeInterval:frameRate target:self selector:@selector(layer2) userInfo:nil repeats:YES];
    }
    else {
        [timer invalidate];
        timer = nil;
        timer = [NSTimer scheduledTimerWithTimeInterval:frameRate target:self selector:@selector(refresh:) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    }
    isLayer ^= 1;
}

-(void) layer2 {
    [view setSlide1:[slide1 intValue]];
    [view setSlide2:[slide2 intValue]];
    [view setSlide3:[slide3 intValue]];
    [view setSlide4:[slide4 intValue]];
    [view drawRect2:_window.frame];
    
    [view setNeedsDisplayInRect:CGRectMake(0, 0, 1, 1)];
}

-(IBAction)changeLayout:(id)sender {
    [slide1 setIntValue:0];
    [slide2 setIntValue:20];
    [slide3 setIntValue:40];
    [slide4 setIntValue:60];
    [view changeLayout];
}

-(void)pause{//Shift + Apple + "P"
	
}

-(IBAction)resetterer:(id)sender{
	[self reset];
    //[slide1 setIntValue:0];
    //[slide2 setIntValue:20];
    //[slide3 setIntValue:40];
    //[slide4 setIntValue:60];
}

-(void)reset{//Apple + "R"
    //[slide1 setIntValue:0];
    //[slide2 setIntValue:20];
    //[slide3 setIntValue:40];
    //[slide4 setIntValue:60];
    [view setNeedsDisplay: true];

    
    [view reset];
}

#pragma mark bounce methods
-(IBAction)togglebounce:(id)sender{//Apple + T
	if(isBounceable){
		isBounceable = NO;
		NSLog(@"no");
        [bounceButton setTitle:@"Bounce\nOFF"];
	}else{
		isBounceable = YES;
		NSLog(@"yes");
        [bounceButton setTitle:@"Bounce\nON"];
	}
	[self addbouncy];
}

//Allows the rectangle objects to bounce
-(void)addbouncy{
	for (int n = 0; n<[[view shapesMut] count]; n++) {
		if ([[[view shapesMut]objectAtIndex:n] isKindOfClass:[RectangleShape class]])
			[[[view shapesMut]objectAtIndex:n] setBouncez: isBounceable];
		else
			NSLog(@"We have a problem");
	}
}

#pragma mark Frame methods
// All the actions when the timer is called
- (IBAction)refresh:(id)sender {
    [view setSlide1:[slide1 intValue]];
    [view setSlide2:[slide2 intValue]];
    [view setSlide3:[slide3 intValue]];
    [view setSlide4:[slide4 intValue]];
    [view setNeedsDisplay: true];
}


// Return the frame rate
+(double)getFrameRate {
    return frameRate;
}


@end
