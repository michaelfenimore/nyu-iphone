//
//  StationView.m
//  Ginza
//
//  Created by Michael Fenimore on 8/1/11.
//  Copyright 2011 --MichaelFenimore--. All rights reserved.
//

#import "StationView.h"
#import "StationController.h"

@implementation StationView

- (id) initWithFrame: (CGRect) frame controller: (StationController *) c {
	self = [super initWithFrame: frame];
	if (self != nil) {
		// Initialization code
		controller = c;
		
		self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"station0.png"]];
		//self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:[stationImages]]];
		
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
}

- (void) dealloc {
	[super dealloc];
}

@end
