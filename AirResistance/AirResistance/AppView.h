//
//  AppView.h
//  AirResistance
//
//  Created by Jules on 3/28/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppView : NSView
{
@public
    int numberShapes;
    
@private
}

- (id)initWithFr:(CGRect)frame:(double)fr;

+(int) getWidth;
+(int) getHeight;
@end
