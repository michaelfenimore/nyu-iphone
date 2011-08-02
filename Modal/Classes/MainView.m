//
//  MainView.m
//  Modal
//
//  Created by scholar on 3/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MainView.h"
#import "MainViewController.h"

@implementation MainView

- (id) initWithFrame: (CGRect) frame controller: (MainViewController *) c {
	self = [super initWithFrame: frame];
	if (self != nil) {
		// Initialization code
		self.backgroundColor = [UIColor whiteColor];
		self.contentMode = UIViewContentModeRedraw;
		
		self.autoresizingMask =
			UIViewAutoresizingFlexibleHeight |
			UIViewAutoresizingFlexibleWidth;
		
		controller = c;
	}
	return self;
}

- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
	[controller presentModalViewController];
}

- (void) drawRect: (CGRect) rect {
	// Drawing code
	UIFont *f = [UIFont systemFontOfSize: 32];
	[@"MainView" drawAtPoint: CGPointZero withFont: f];
}

- (void) dealloc {
	//Do not release controller.
	[super dealloc];
}

@end
