//
//  View.h
//  Swipe
//
//  Created by Fenimore, Michael on 7/5/11.
//  Copyright 2011 --MichaelFenimore--. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface View : UIView {
	CGPoint pointBegan;
	CGPoint pointMoved;
	
	NSTimeInterval timeBegan;
	NSTimeInterval timeMoved;
}

@end