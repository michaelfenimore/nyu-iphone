//
//  View.m
//  ViewController
//
//  Created by Computer Lab 1040 on 07/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "View.h"
#import "ViewController.h"

@implementation View


- (id) initWithFrame: (CGRect) frame controller: (ViewController *) c {
	if ((self = [super initWithFrame: frame]) != nil) {
		// Initialization code
		self.backgroundColor = [UIColor whiteColor];
		viewController = c;
	}
	return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
	NSString *s = nil;
	switch ([viewController model]) {
		case UIInterfaceOrientationPortrait:
			s = @"Portrait";
			break;
			
		case UIInterfaceOrientationPortraitUpsideDown:
			s = @"PortraitUpsideDown";
			break;
			
		case UIInterfaceOrientationLandscapeLeft:	//Home button on left
			s = @"LandscapeLeft";
			break;
			
		case UIInterfaceOrientationLandscapeRight:
			s = @"LandscapeRight";
			break;
			
		default:
			s = @"unknown";
			break;
	}
	
	//Center the string in the PLView.
	UIFont *f = [UIFont fontWithName: @"Courier" size: 13.2]; //monospace
	CGFloat x = 4;
	CGFloat y = 0;
	CGFloat dy = [s sizeWithFont: f].height;
	[s drawAtPoint: CGPointMake(x, y) withFont: f];
	
	CGRect r = self.frame;
	s = [NSString stringWithFormat:
		 @"     self.frame  == (%2g, %2g), %g × %g",
		 r.origin.x, r.origin.y, r.size.width, r.size.height];
	[s drawAtPoint: CGPointMake(x, y += 2 * dy) withFont: f];
	
	r = self.bounds;
	s = [NSString stringWithFormat:
		 @"     self.bounds == (%2g, %2g), %g × %g",
		 r.origin.x, r.origin.y, r.size.width, r.size.height];
	[s drawAtPoint: CGPointMake(x, y += dy) withFont: f];
	
	r = self.superview.frame;
	s = [NSString stringWithFormat:
		 @"superview.frame  == (%2g, %2g), %g × %g",
		 r.origin.x, r.origin.y, r.size.width, r.size.height];
	[s drawAtPoint: CGPointMake(x, y += dy) withFont: f];
	
	r = self.superview.bounds;
	s = [NSString stringWithFormat:
		 @"superview.bounds == (%2g, %2g), %g × %g",
		 r.origin.x, r.origin.y, r.size.width, r.size.height];
	[s drawAtPoint: CGPointMake(x, y += dy) withFont: f];
	
	s = @"CTM == ";
	[s drawAtPoint: CGPointMake(x, y += 2 * dy) withFont: f];
	
	CGContextRef c = UIGraphicsGetCurrentContext();
	CGAffineTransform ctm = CGContextGetCTM(c);
	
	s = [NSString stringWithFormat: @"%5g%5g%5g", ctm.a,  ctm.b,  0.0];
	[s drawAtPoint: CGPointMake(x, y += dy) withFont: f];
	
	s = [NSString stringWithFormat: @"%5g%5g%5g", ctm.c,  ctm.d,  0.0];
	[s drawAtPoint: CGPointMake(x, y += dy) withFont: f];
	
	s = [NSString stringWithFormat: @"%5g%5g%5g", ctm.tx, ctm.ty, 1.0];
	[s drawAtPoint: CGPointMake(x, y += dy) withFont: f];
	
}

- (void)dealloc {
    [super dealloc];
}


@end
