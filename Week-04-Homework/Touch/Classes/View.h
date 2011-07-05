//
//  View.h
//  Touch
//
//  Created by Fenimore, Michael on 7/1/11.
//  Copyright 2011 --MichaelFenimore--. All rights reserved.
//	Although you can import the AVFoundation framework you 
//	MUST ALSO ADD IT TO YOUR FRAMEWORKS folder!
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface View : UIView {
	UIView *myView;
	AVAudioPlayer *player;
}

@end