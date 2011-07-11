//
//  myView.m
//  Week-03-Homework
//
//  Created by Michael Fenimore on 6/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "myView.h"


@implementation myView


- (id)initWithFrame:(CGRect)frame {
    
    if ((self = [super initWithFrame:frame]) != nil);
	
	if (self) {
        // Initialization code.
		self.backgroundColor = [UIColor colorWithRed:0.75 green:0.75 blue:0.5 alpha:1.0];
		
		//Keep the size of the view the same but let the center of the view be the origin.
		//CGFloat w = self.bounds.size.width;
		//CGFloat h = self.bounds.size.height;
		//self.bounds = CGRectMake(-w / 2, -h / 2, w, h);
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
	
	//The four values are the Bounds Origin of X & Y and then Width by Height
    NSLog(@"self.bounds == (%g, %g), %g x %g ",
		  self.bounds.origin.x,
		  self.bounds.origin.y,
		  self.bounds.size.width,
		  self.bounds.size.height
		  );
	
	//The four values are the Frames Origin of X & Y and then Width by Height
    NSLog(@"self.frame == (%g, %g), %g x %g ",
		  self.frame.origin.x,
		  self.frame.origin.y,
		  self.frame.size.width,
		  self.frame.size.height
		  );
	
	NSString *myString = NSLocalizedString(@"Shape", @"Displayed with drawAtPoint:");	//Assigns text from file
	UIFont *myFont = [UIFont systemFontOfSize:22.0];	//Assign font size
	CGPoint myPoint = CGPointMake(70.0, 5.0);			//Determines starting point of text
	[myString drawAtPoint:myPoint withFont:myFont];		//Output to screen
	
	//Isosceles Triangle
	CGSize screenSize = self.bounds.size;
	CGFloat min = MIN(screenSize.width, screenSize.height);
	CGFloat longSide = min * 3/4;
	CGFloat shortSide = longSide / 1.5;
	
	//Validates in console what the dimensions are.
	NSLog(@"My Dimmensions == LongSide:%g  ShortSide:%g ",
		  longSide,
		  shortSide
		  );
	
	CGMutablePathRef myPath = CGPathCreateMutable();
	CGPathMoveToPoint(myPath, NULL, 0, 0);
	CGPathAddLineToPoint(myPath, NULL, shortSide, 0);
	CGPathAddLineToPoint(myPath, NULL, shortSide/2, longSide);
	CGPathCloseSubpath(myPath);
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	//Moves the Isosceles Triangle into the middle of the screen
	CGContextTranslateCTM(context,
						  (screenSize.width) / 4,
						  (screenSize.height) / 1.5
						  );
	
	//Flips the Isosceles Triangle
	CGContextScaleCTM(context, 1, -1);
	
	//Ability to rotate the image.
	//CGContextRotateCTM(context, -10.0 * M_PI / 180.0);
	
	CGContextBeginPath(context);
	CGContextAddPath(context, myPath);
	CGContextSetRGBFillColor(context, 1.0, 0.2, 0.2, 1);
	CGContextFillPath(context);
}

- (void)dealloc {
    [super dealloc];
}


@end
