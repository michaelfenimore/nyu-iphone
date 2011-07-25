//
//  View.h
//  Pong
//
//  Created by Michael Fenimore on 7/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface View : UIView {
	UIView *paddle;
	UIView *invader;
	CGFloat dx, dy; //Direction and speed of balls motion
	AVAudioPlayer *audioPlayer;

}

-(void) move: (CADisplayLink *) displayLink;

@end
