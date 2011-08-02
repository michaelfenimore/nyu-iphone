//
//  InfoView.m
//  LTrain
//
//  Created by scholar on 7/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "InfoView.h"

@implementation InfoView
@synthesize information;

- (id) initWithFrame: (CGRect) frame information: (NSString *) i {
	self = [super initWithFrame: frame];
	if (self != nil) {
		// Initialization code
		self.backgroundColor = [UIColor redColor];
		self.information = i;
	}
	return self;
}

- (void) drawRect: (CGRect) rect {
	// Drawing code
	UIFont *f = [UIFont systemFontOfSize: 24];
	[self.information drawAtPoint: CGPointZero withFont: f];
}

- (void) dealloc {
	[information release];
	[super dealloc];
}

@end
