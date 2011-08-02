//
//  StationView.m
//  Navigate
//
//  Created by Ann McDermott on 7/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "StationView.h"
#import "StationController.h"

@implementation StationView

- (id) initWithFrame: (CGRect) frame controller: (StationController *) c {
	self = [super initWithFrame: frame];
	if (self != nil) {
		// Initialization code
		controller = c;
		
		self.backgroundColor =
			[UIColor colorWithRed: 1.0
			green: 1.0
			blue: 1.0
			alpha: 1.0
		];
		
		//Change the bounds when the iPhone's orientation changes.
		self.autoresizingMask =
			UIViewAutoresizingFlexibleHeight |
			UIViewAutoresizingFlexibleWidth;
		
		//Call drawRect: when the bounds change.
		self.contentMode = UIViewContentModeRedraw;
	}
	return self;
}

- (void) touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event {
	[controller nextStation];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void) drawRect: (CGRect) rect {
	// Drawing code
	UIFont *f = [UIFont systemFontOfSize: 21];
	NSString *s = [controller title];
	CGSize size = [s sizeWithFont: f];
	CGFloat dy = size.height;
	CGFloat x = dy / 4;
	CGFloat y = 0;
	
	[s drawAtPoint: CGPointMake(x, y) withFont: f];
	
	CGRect r = self.bounds;
	s = [NSString stringWithFormat:
		 @"self.bounds == (%g, %g), %g × %g",
		 r.origin.x, r.origin.y, r.size.width, r.size.height];
	[s drawAtPoint: CGPointMake(x, y + dy) withFont: f];
}

- (void) dealloc {
	[super dealloc];
}

@end
