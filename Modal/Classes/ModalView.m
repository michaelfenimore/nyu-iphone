//
//  ModalView.m
//  Modal
//
//  Created by scholar on 3/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ModalView.h"
#import "ModalViewController.h"

@implementation ModalView

- (id) initWithFrame: (CGRect) frame controller: (ModalViewController *) c{
	self = [super initWithFrame: frame];
	if (self != nil) {
		// Initialization code
		self.backgroundColor = [UIColor orangeColor];
		self.contentMode = UIViewContentModeRedraw;
		
		self.autoresizingMask =
			UIViewAutoresizingFlexibleHeight |
			UIViewAutoresizingFlexibleWidth;
		
		controller = c;
	}
	return self;
}

- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
	[controller dismissModalViewController];
}

- (void) drawRect: (CGRect) rect {
	// Drawing code
	UIFont *f = [UIFont systemFontOfSize: 32];
	[@"ModalView" drawAtPoint: CGPointZero withFont: f];

}

- (void) dealloc {
	[super dealloc];
}

@end
