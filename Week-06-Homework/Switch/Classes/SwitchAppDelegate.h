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
	
	AVAudioPlayer *player1;
	AVAudioPlayer *player2;
	AVAudioPlayer *player3;
	AVAudioPlayer *player4;
	AVAudioPlayer *player5;
	View *myView;
	UIWindow *window;
}

- (void) valueChanged1: (id) sender;
- (void) valueChanged2: (id) sender;
- (void) valueChanged3: (id) sender;
- (void) valueChanged4: (id) sender;
- (void) valueChanged5: (id) sender;

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end