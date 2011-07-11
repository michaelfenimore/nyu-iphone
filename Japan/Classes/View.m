//
//  View.m
//  Japan
//
//  Created by Fenimore, Michael on 6/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "View.h"


@implementation View


- (id)initWithFrame:(CGRect)frame {
    
    if ((self = [super initWithFrame:frame]) != nil);
    if (self) {
        // Initialization code.
		self.backgroundColor = [UIColor whiteColor];
		
		//Keep the size of the view the same,
		//but let the center of the view be the origin.
		//CGFloat w = self.bounds.size.width;
		//CGFloat h = self.bounds.size.height;
		//self.bounds = CGRectMake(-w / 2, -h / 2, w, h);
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
	
	/* CODE FOR JAPAN *****************************************************
	CGContextRef cc = UIGraphicsGetCurrentContext();
	CGAffineTransform ctm = CGContextGetCTM(cc);
	NSLog(@"%6g%6g%6g", ctm.a,  ctm.b,  0.0);
	NSLog(@"%6g%6g%6g", ctm.c,  ctm.d,  0.0);
	NSLog(@"%6g%6g%6g", ctm.tx, ctm.ty, 1.0);	//translate x, translate 
	
	NSLog(@"self.frame == (%g, %g), %g × %g",
		  self.frame.origin.x,
		  self.frame.origin.y,
		  self.frame.size.width,
		  self.frame.size.height
		  );
	
	NSLog(@"self.bounds == (%g, %g), %g × %g",
		  self.bounds.origin.x,
		  self.bounds.origin.y,
		  self.bounds.size.width,
		  self.bounds.size.height
		  );
	
	CGRect b = self.bounds;
	CGFloat radius = .3 * b.size.width;	//in pixels
	*/
	/*
	 Create the invisible square that will surround the circle.
	 Place the upper left corner of the square at the upper left corner of
	 the View.  b.origin.x and b.origin.y are the coordinates of the upper
	 left corner of the View.
	 */
	/*
	CGRect r = CGRectMake(-radius,
						  -radius,
						  2 * radius,
						  2 * radius
						  );
	
	CGContextRef c = UIGraphicsGetCurrentContext();
	
	//Moves the circle to the lower right corner
	//CGContextTranslateCTM(c, b.size.width / 2, b.size.height / 2);
	
	CGContextBeginPath(c); //unnecessary here: the path is already empty.
	CGContextAddEllipseInRect(c, r);
	CGContextSetRGBFillColor(c, 1.0, 0.0, 0.0, 1.0);	//red, opaque
	CGContextFillPath(c);
	END CODE FOR JAPAN ******************************************************
	 */
	
	//RED CROSS *************************************************************
	CGSize size = self.bounds.size;
	CGFloat min = MIN(size.width, size.height);
	CGFloat longSide = min * 15 / 16;
	CGFloat shortSide = longSide / 3;
	
	CGContextRef c = UIGraphicsGetCurrentContext();
	CGContextBeginPath(c);
	
	CGContextTranslateCTM(c, size.width / 2, size.height / 2); //origin at center of view
	CGContextScaleCTM(c, 1, -1);                               //make Y axis point up
	
	//Rotates the cross
	CGContextRotateCTM(c, -15.0 * M_PI / 180.0);
	
	CGRect horizontal = CGRectMake(-longSide / 2, -shortSide / 2, longSide, shortSide);
	CGContextAddRect(c, horizontal);
	
	CGContextSetRGBFillColor(c, 1.0, 0.0, 0.0, 1.0);
	
	//4 is the amount of blur.  A smaller number makes a sharper shadow.
	CGContextSetShadow(c, CGSizeMake(10, 10), 4);
	CGContextFillPath(c);
	
	CGContextBeginPath(c);
	CGContextRotateCTM(c, M_PI / 2);	//90 degrees clockwise
	CGContextAddRect(c, horizontal);
	
	//4 is the amount of blur.  A smaller number makes a sharper shadow.
	CGContextSetShadow(c, CGSizeMake(10, 10), 4);
	CGContextSetRGBFillColor(c, 0.0, 0.5, 1.0, 0.7);
	CGContextFillPath(c);
	//END RED CROSS ************************************************************ 
	 
	
	/*
	//RIGHT TRIANGLE.
	CGSize size = self.bounds.size;
	CGFloat min = MIN(size.width, size.height);
	CGFloat length = min * 5 / 8;           //of side
	
	CGMutablePathRef p = CGPathCreateMutable();   //right triangle
	CGPathMoveToPoint(p, NULL, 0, 0);          //lower right vertex (the right angle)
	CGPathAddLineToPoint(p, NULL, 0, length);  //upper right vertex
	CGPathAddLineToPoint(p, NULL, -length, 0); //lower left vertex
	CGPathCloseSubpath(p);
	
	CGContextRef c = UIGraphicsGetCurrentContext();
	
	//Origin at right angle.
	CGContextTranslateCTM(c,
						  (size.width + length) / 2,
						  (size.height + length) / 2
						  );
	
	CGContextScaleCTM(c, 1, -1);	
	CGContextBeginPath(c);
	CGContextAddPath(c, p);
	CGContextSetRGBFillColor(c, 1.0, 0.0, 0.0, 1);
	CGContextFillPath(c);
	
	CGContextBeginPath(c);
	CGContextAddPath(c, p);
	CGContextSetLineWidth(c, 10.0);
	CGContextSetRGBStrokeColor(c, 0.0, 0.0, 1.0, 1);
	CGContextStrokePath(c);	
	CGPathRelease(p);
	 */
}

- (void)dealloc {
    [super dealloc];
}

@end