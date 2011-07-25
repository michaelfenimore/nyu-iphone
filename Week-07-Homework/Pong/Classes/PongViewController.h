//
//  PongViewController.h
//  Pong
//
//  Created by Michael Fenimore on 7/24/11.
//  Copyright 2011 -MichaelFenimore--. All rights reserved.
//

#import <UIKit/UIKit.h>
//Note: CADisplayLink requires QuartzCore.framework
#import <QuartzCore/QuartzCore.h>

@interface PongViewController : UIViewController {
	CADisplayLink *displayLink;
}

@end