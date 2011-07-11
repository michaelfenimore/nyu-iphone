//
//  View.m
//  sine
//
//  Created by Fenimore, Michael on 7/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "View.h"


@implementation View


- (id)initWithFrame:(CGRect)frame {
    
    if ((self = [super initWithFrame: frame]) != nil) {
		// Initialization code
		self.backgroundColor = [UIColor whiteColor];
	}
	return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
	CGContextRef c = UIGraphicsGetCurrentContext();
	
	//Origin at center of view.
	CGSize size = self.bounds.size;
	
	CGAffineTransform translate = CGAffineTransformMakeTranslation(
																   size.width / 2,
																   size.height / 2
																   );
	
	//Graph sine as x goes from -2pi to +2pi,
	//drawing 2 complete sine waves.
	CGFloat width = 4 * M_PI;
	CGFloat scale = size.width / width;
	
	//iPhone origin in upper left corner, Y axis points down.
	CGAffineTransform sineScale = CGAffineTransformMakeScale(scale, -scale);
	
	//Axes
	CGContextConcatCTM(c, translate);
	CGContextBeginPath(c);
	
	//X axis
	CGContextMoveToPoint(c, -size.width / 2, 0);
	CGContextAddLineToPoint(c, size.width / 2, 0);
	
	//Y axis
	CGContextMoveToPoint(c, 0, size.height / 2);
	CGContextAddLineToPoint(c, 0, -size.height / 2);
	
	CGContextSetRGBStrokeColor(c, 0, 0, 1, 0.5);
	CGContextStrokePath(c);
	
	//Graph of sine function.
	CGContextConcatCTM(c, sineScale);
	CGContextBeginPath(c);
	
	BOOL first = YES;
	for (CGFloat x = -2 * M_PI; x <= 2 * M_PI; x += 1 / scale) {
		//CGFloat y = cosf(x);
		CGFloat y = sinf(x);
		//CGFloat y = x * x / 2;
		//CGFloat y = floorf(x);
		//CGFloat y = x * sinf(3 * x);
		//CGFloat y = 3 * sinf(80 / x);
		
		if (first) {
			first = NO;
			CGContextMoveToPoint(c, x, y);	//first iteration of loop
			//NSLog(@"C:%g  X:%g  Y:%g", c, x, y);
		} else {
			CGContextAddLineToPoint(c, x, y);
			//NSLog(@"C:%g  X:%g  Y:%g", c, x, y);
		}
	}
	
	CGContextSetLineWidth(c, 2.0 / scale);
	CGContextSetRGBStrokeColor(c, 0.0, 0.0, 0.0, 1.0);
	CGContextStrokePath(c);	
}

- (void)dealloc {
    [super dealloc];
}


@end
