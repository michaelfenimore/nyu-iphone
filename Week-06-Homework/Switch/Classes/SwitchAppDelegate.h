//
//  SwitchAppDelegate.h
//  Switch
//
//  Created by Michael Fenimore on 7/20/11.
//  Copyright 2011 --MichaelFenimore--. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioPlayer.h>
@class View;

@interface SwitchAppDelegate : NSObject <UIApplicationDelegate, AVAudioPlayerDelegate> {
	
	AVAudioPlayer *player;
	View *myView;
	UIWindow *window;
}

- (void) valueChanged: (id) sender;

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end