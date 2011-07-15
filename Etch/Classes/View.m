//
//  View.m
//  Etch
//
//  Created by Computer Lab 1040 on 07/14/11.
//  Copyright 2011 --Michael Fenimore--. All rights reserved.
//

#import "View.h"


@implementation View


- (id) initWithFrame: (CGRect) frame {
	if ((self = [super initWithFrame: frame]) != nil) {
		// Initialization code
		self.backgroundColor = [UIColor whiteColor];
		drawing = CGPathCreateMutable();	//born empty
	}
	return self;
}

- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
	CGPoint p = [[touches anyObject] locationInView: self];
	CGPathMoveToPoint(drawing, NULL, p.x, p.y);
}

- (void) touchesMoved: (NSSet *) touches withEvent: (UIEvent *) event {
	CGPoint p = [[touches anyObject] locationInView: self];
	CGPathAddLineToPoint(drawing, NULL, p.x, p.y);
	[self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
	CGContextRef c = UIGraphicsGetCurrentContext();
	CGContextBeginPath(c);
	CGContextAddPath(c, drawing);
	CGContextSetRGBStrokeColor(c, 0, 0, 0, 1);	//black
	CGContextStrokePath(c);
}

- (void) clearPath {
	CGPathRelease(drawing);
	drawing = CGPathCreateMutable();
	[self setNeedsDisplay];
}

- (void)dealloc {
	CGPathRelease(drawing);
    [super dealloc];
}


@end
