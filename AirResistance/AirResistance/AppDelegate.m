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

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    frameRate = 0.01;
	
	isBounceable = NO;
	
    // Create the main window
    [self.window setFrame:CGRectMake(300, 200, 750, 500) display:YES];
    [self.window setStyleMask:[self.window styleMask] & ~NSResizableWindowMask];
    view = [[AppView alloc] initWithFr:_window.frame:frameRate];
    [view setFrameOrigin:NSMakePoint(0, 0)];
    [self.window.contentView addSubview:view];
    
    // Set the timer
    timer = [NSTimer scheduledTimerWithTimeInterval:frameRate target:self selector:@selector(refresh:) userInfo:nil repeats:YES];
	
	dragxslider = [[NSSlider alloc]init];
	dragxslider.frame = CGRectMake(0, 0, 80, 30);
	[self.window.contentView addSubview:dragxslider];
	
	dragyslider = [[NSSlider alloc]init];
	dragyslider.frame = CGRectMake(180, 0, 80, 30);
	[self.window.contentView addSubview:dragyslider];

	bounceButton = [[NSButton alloc]initWithFrame:CGRectMake(self.window.frame.size.width-80, self.window.frame.size.height-80, 70, 70)];
	[bounceButton setAction:@selector(togglebounce:)];
	[self.window.contentView addSubview:bounceButton];
}

#pragma mark bounce methods
-(IBAction)togglebounce:(id)sender{
	if(isBounceable){
		isBounceable = NO;
		NSLog(@"no");
	}else{
		isBounceable = YES;
		NSLog(@"yes");
	}
	[self addbouncy];
}
//Allows the rectangle objects to bounce
-(void)addbouncy{
	for (int n = 0; n<[[view shapesMut] count]; n++) {
		if ([[[view shapesMut]objectAtIndex:n] isKindOfClass:[RectangleShape class]]) {
			[[[view shapesMut]objectAtIndex:n] setBouncez: isBounceable];
			 
		}else{
			NSLog(@"We have a problem");
		}
	}
}

#pragma mark Frame methods
// All the actions when the timer is called
- (IBAction)refresh:(id)sender {
    [view setNeedsDisplay: true];
}


// Return the frame rate
+(double)getFrameRate {
    return frameRate;
}


@end
