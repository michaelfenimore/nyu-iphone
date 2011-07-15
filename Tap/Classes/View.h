//
//  View.h
//  Tap
//
//  Created by Michael Fenimore on 7/10/11.
//  Copyright 2011 --MichaelFenimore--. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface View : UIView {
	UILabel *theLabel;
	NSUInteger tapCount;
	NSUInteger wearOff;
}

@end