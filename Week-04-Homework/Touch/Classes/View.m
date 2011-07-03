//
//  View.m
//  Touch
//
//  Created by Fenimore, Michael on 7/1/11.
//  Copyright 2011 --MichaelFenimore--. All rights reserved.
//

#import "View.h"


@implementation View


- (id) initWithFrame: (CGRect) frame {
	if ((self = [super initWithFrame: frame]) != nil) {
		//self.backgroundColor = [UIColor whiteColor];
		self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"stars.png"]];
		
		CGRect theBounds = self.bounds;
		//NSLog(@"The Bounds: %g, %g", theBounds.origin.x, theBounds.origin.y);
		//NSLog(@"The Dimensions: %g, %g", theBounds.size.width, theBounds.size.height);
		CGFloat shapeWidth = 80;
		CGFloat shapeHeight = 80;
		
		//To center the object
		CGRect myBox = CGRectMake(theBounds.size.width/2 - shapeWidth/2,
								  theBounds.size.height/2 - shapeHeight/2,
								  shapeWidth,
								  shapeHeight);
		myView = [[UIView alloc] initWithFrame: myBox];
		myView.backgroundColor = [UIColor blackColor];
		[self addSubview: myView];
	}
	return self;
}

- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
	if (touches.count > 0) {
		myView.backgroundColor = [UIColor greenColor];
		[UIView animateWithDuration: 3.0
							  delay: 0.0
							options: UIViewAnimationOptionCurveEaseInOut
						 animations: ^{
							 myView.center = [[touches anyObject] locationInView: self];
						 }
						 completion: ^(BOOL finished ){
							 myView.backgroundColor = [UIColor blackColor];
						 }
		 ];
	}
}

- (void) touchesMoved: (NSSet *) touches withEvent: (UIEvent *) event {
	if (touches.count > 0) {
		myView.center = [[touches anyObject] locationInView: self];
		myView.backgroundColor = [UIColor greenColor];
	}
}

- (void) touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event {
	
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/

- (void)dealloc {
	[myView release];
    [super dealloc];
}


@end
