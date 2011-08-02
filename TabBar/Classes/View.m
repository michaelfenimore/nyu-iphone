//
//  View.m
//  TabBar
//
//  Created by NYU User on 12/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "View.h"
#import "ViewController.h"


@implementation View


- (id) initWithFrame: (CGRect) frame controller: (ViewController *) c {
	if ((self = [super initWithFrame: frame]) != nil) {
		// Initialization code
		self.backgroundColor = [UIColor whiteColor];
		viewController = c;
		
		//Change the bounds whenever the orientation changes.
		//For example, when orientation changes from portrait to landscape,
		//change the bounds.size from 320 x 460 to 480 x 300.
		
		self.autoresizingMask =
			UIViewAutoresizingFlexibleHeight |
			UIViewAutoresizingFlexibleWidth;
		 
		
		//Call drawRect: whenever the bounds change.
		self.contentMode = UIViewContentModeRedraw;
	}
	return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void) drawRect: (CGRect) rect {
	// Drawing code
	UIFont *f = [UIFont fontWithName: @"Courier" size: 13.2]; //monospace
	NSString *s = viewController.text;
	CGFloat dy = [s sizeWithFont: f].height;
	CGFloat x = dy / 4;
	CGFloat y = 0;
	[s drawAtPoint: CGPointMake(x, y) withFont: f];
	
	CGRect r = self.frame;
	s = [NSString stringWithFormat: @"      self.frame == (%2g, %2g), %g × %g",
		 r.origin.x, r.origin.y, r.size.width, r.size.height];
	[s drawAtPoint: CGPointMake(x, y += dy) withFont: f];
	
	r = self.bounds;
	s = [NSString stringWithFormat: @"     self.bounds == (%2g, %2g), %g × %g",
		 r.origin.x, r.origin.y, r.size.width, r.size.height];
	[s drawAtPoint: CGPointMake(x, y += dy) withFont: f];
	
	r = self.superview.frame;
	s = [NSString stringWithFormat:
		 @" superview.frame == (%2g, %2g), %g × %g",
		 r.origin.x, r.origin.y, r.size.width, r.size.height];
	[s drawAtPoint: CGPointMake(x, y += 2 * dy) withFont: f];
	
	r = self.superview.bounds;
	s = [NSString stringWithFormat:
		 @"superview.bounds == (%2g, %2g), %g × %g",
		 r.origin.x, r.origin.y, r.size.width, r.size.height];
	[s drawAtPoint: CGPointMake(x, y += dy) withFont: f];
	
	r = self.superview.superview.frame;
	s = [NSString stringWithFormat:
		 @"       s.s.frame == (%2g, %2g), %g × %g",
		 r.origin.x, r.origin.y, r.size.width, r.size.height];
	[s drawAtPoint: CGPointMake(x, y += 2 * dy) withFont: f];
	
	r = self.superview.superview.bounds;
	s = [NSString stringWithFormat:
		 @"      s.s.bounds == (%2g, %2g), %g × %g",
		 r.origin.x, r.origin.y, r.size.width, r.size.height];
	[s drawAtPoint: CGPointMake(x, y += dy) withFont: f];
	
	r = self.superview.superview.superview.frame;
	s = [NSString stringWithFormat:
		 @"     s.s.s.frame == (%2g, %2g), %g × %g",
		 r.origin.x, r.origin.y, r.size.width, r.size.height];
	[s drawAtPoint: CGPointMake(x, y += 2 * dy) withFont: f];
	
	r = self.superview.superview.superview.bounds;
	s = [NSString stringWithFormat:
		 @"    s.s.s.bounds == (%2g, %2g), %g × %g",
		 r.origin.x, r.origin.y, r.size.width, r.size.height];
	[s drawAtPoint: CGPointMake(x, y += dy) withFont: f];	
	
	CGContextRef c = UIGraphicsGetCurrentContext();
	CGAffineTransform ctm = CGContextGetCTM(c);
	
	s = [NSString stringWithFormat: @"CTM == %5g%5g%5g", ctm.a,  ctm.b,  0.0];
	[s drawAtPoint: CGPointMake(x, y += dy) withFont: f];
	
	s = [NSString stringWithFormat: @"       %5g%5g%5g", ctm.c,  ctm.d,  0.0];
	[s drawAtPoint: CGPointMake(x, y += dy) withFont: f];
	
	s = [NSString stringWithFormat: @"       %5g%5g%5g", ctm.tx, ctm.ty, 1.0];
	[s drawAtPoint: CGPointMake(x, y += dy) withFont: f];
	
}


- (void) dealloc {
	[super dealloc];
}


@end
