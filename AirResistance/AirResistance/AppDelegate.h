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
	NSSlider *slide1;
	NSSlider *slide2;
    NSSlider *slide3;
    NSSlider *slide4;
	NSButton *bounceButton;
	NSButton *reset;
    NSButton *layout;
    NSButton *layer;
}

@property (assign) IBOutlet NSWindow *window;

@property (nonatomic, retain) IBOutlet NSTextField *box1;
@property (nonatomic, retain) IBOutlet NSTextField *box2;
@property (nonatomic, retain) IBOutlet NSTextField *box3;
@property (nonatomic, retain) IBOutlet NSTextField *box4;


- (IBAction)refresh:(id)sender;

+(double)getFrameRate;

-(IBAction)togglebounce:(id)sender;
-(void)addbouncy;
-(IBAction)resetterer:(id)sender;

-(IBAction)changeLayout:(id)sender;

@end
