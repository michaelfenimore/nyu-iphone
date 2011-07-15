//
//  BigView.h
//  Flip
//
//  Created by Fenimore, Michael on 7/12/11.
//  Copyright 2011 --MichaelFenimore--. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BigView : UIView {
	//Holds the two subviews we will transtion between
	NSArray *views;
	
	//Index in views of the currently displayed little view: 0 or 1
	NSUInteger index;
	
	CGPoint pointBegan;
	CGPoint pointMoved;
}

@end
