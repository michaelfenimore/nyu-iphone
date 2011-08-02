//
//  StationView.m
//  LTrain
//
//  Created by scholar on 7/14/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "StationView.h"
#import "StationController.h"

@implementation StationView

- (void) moreInfo {
	[controller moreInfo];
}

- (id) initWithFrame: (CGRect) frame controller: (StationController *) c {
	self = [super initWithFrame: frame];
	if (self != nil) {
		// Initialization code
		controller = c;
		self.backgroundColor = [UIColor whiteColor];
		
		//Change the bounds when the iPhone's orientation changes.
		self.autoresizingMask =
			UIViewAutoresizingFlexibleHeight |
			UIViewAutoresizingFlexibleWidth;
		
		//Call drawRect: when the bounds change.
		self.contentMode = UIViewContentModeRedraw;

		button = [UIButton buttonWithType: UIButtonTypeRoundedRect];
		[button retain];
	
		//Center the button in the view.
		CGSize s = self.bounds.size;
		self.bounds = CGRectMake(-s.width / 2, -s.height / 2, s.width, s.height);
		
		NSString *title = @"More info";
		[button setTitle: title forState: UIControlStateNormal];
		s = [title sizeWithFont: button.titleLabel.font];
		
		button.frame = CGRectMake(0, 0, s.width + 20, s.height + 10);
		button.center = CGPointZero;
		
		[button addTarget: self
			action: @selector(moreInfo)
			forControlEvents: UIControlEventTouchUpInside];
		
		[self addSubview: button];
	}
	return self;
}

- (void) drawRect: (CGRect) rect {
	// Drawing code
}

- (void) dealloc {
	[button release];
	[super dealloc];
}

@end
