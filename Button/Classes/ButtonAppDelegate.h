//
//  ButtonAppDelegate.h
//  Button
//
//  Created by Computer Lab 1040 on 07/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>	//needed for SystemSoundID
@class View;

@interface ButtonAppDelegate : NSObject <UIApplicationDelegate> {
    SystemSoundID sid;
	View *view;
	UIWindow *window;
}

- (void) touchUpInside: (id) sender;

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end