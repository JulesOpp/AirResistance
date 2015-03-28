//
//  AppDelegate.m
//  AirResistance
//
//  Created by Jules on 3/28/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "AppView.h"

@implementation AppDelegate

@synthesize window = _window; // The main window

NSTimer *timer; // Timer running telling the engine to update
AppView *view; // Reference to the AppView
double frameRate; // The frameRate is what the timer is based upon

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    frameRate = 0.01;
    
    // Create the main window
    [self.window setFrame:CGRectMake(300, 200, 750, 500) display:YES];
    [self.window setStyleMask:[self.window styleMask] & ~NSResizableWindowMask];
    view = [[AppView alloc] initWithFr:_window.frame:frameRate];
    [view setFrameOrigin:NSMakePoint(0, 0)];
    [self.window.contentView addSubview:view];
    
    // Set the timer
    timer = [NSTimer scheduledTimerWithTimeInterval:frameRate target:self selector:@selector(refresh:) userInfo:nil repeats:YES];
}


// All the actions when the timer is called
- (IBAction)refresh:(id)sender {
    [view setNeedsDisplay: true];
}


// Return the frame rate
+(double)getFrameRate {
    return frameRate;
}


@end
