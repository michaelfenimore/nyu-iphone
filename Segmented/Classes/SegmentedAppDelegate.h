//
//  SegmentedAppDelegate.h
//  Segmented
//
//  Created by Computer Lab 1040 on 07/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@class View;

@interface SegmentedAppDelegate : NSObject <UIApplicationDelegate, AVAudioRecorderDelegate, AVAudioPlayerDelegate> {
    AVAudioSession *session;
	NSURL *url;
	AVAudioRecorder *recorder;
	AVAudioPlayer *player;
	
	View *view;
	UIWindow *window;	
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

