//
//  AppDelegate.h
//  AirResistance
//
//  Created by Jules on 3/28/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
{
	NSSlider *dragxslider;
	NSSlider *dragyslider;
	NSButton *bounceButton;
    @public
    
    @private
    
    
}

@property (assign) IBOutlet NSWindow *window;

- (IBAction)refresh:(id)sender;

+(double)getFrameRate;

-(IBAction)togglebounce:(id)sender;
-(void)addbouncy;
@end
