//
//  View.m
//  Pinch
//
//  Created by Michael Fenimore on 7/10/11.
//  Copyright 2011 --MichaelFenimore--. All rights reserved.
//

#import "View.h"


@implementation View


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
		self.multipleTouchEnabled = YES;
		txtLabel.userInteractionEnabled = YES;
    }
    return self;
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	if (touches.count == 2) {
		NSArray *myTouch = touches.allObjects;
		current0 = [[myTouch objectAtIndex: 0] locationInView: self];
		current1 = [[myTouch objectAtIndex: 1] locationInView: self];
		
		previous0 = [[myTouch objectAtIndex: 0] previousLocationInView: self];
		previous1 = [[myTouch objectAtIndex: 1] previousLocationInView: self];
		[self setNeedsDisplay];
	}

}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGFloat distanceX = current0.x - current1.x;
	CGFloat distanceY = current0.y - current1.y;
	CGFloat	currentDistance = hypot(distanceX, distanceY);
	
	distanceX = previous0.x - previous1.x;
	distanceY = previous0.y - previous1.y;
	CGFloat previouseDistance = hypot(distanceX, distanceY);
	
	NSString *myTouch = nil;
	
	if (currentDistance > previouseDistance) {
		myTouch = @"Spread";
	} else if (currentDistance < previouseDistance) {
		myTouch = @"Pinch";
	} else {
		myTouch = @"Neither";
	}
		
	NSString *myString = [NSString stringWithFormat: @"%@ %d", myTouch, (int)currentDistance];
	//CGSize size = [myString sizeWithFont: theFont];
	//CGRect theBounds = self.bounds;
	UIFont *theFont = [UIFont systemFontOfSize: currentDistance / 2];
	CGSize labelSize = [myString sizeWithFont: theFont];
	
	CGRect theFrame = txtLabel.frame;
	theFrame.size.height = labelSize.height;
	txtLabel.frame = theFrame;

	//CGFloat x = theBounds.origin.x + (theBounds.size.width - size.width) / 2;
	
	txtLabel = [[UILabel alloc] initWithFrame:theFrame];
	txtLabel.font = theFont;
	txtLabel.backgroundColor = [UIColor whiteColor];
	txtLabel.textColor = [UIColor blackColor];
	txtLabel.text = myString;
	NSLog(@"Text:%@", myString);
	[self addSubview:txtLabel];
	
	//[myString drawAtPoint: CGPointMake(x, 0.0) withFont: theFont];

}

- (void)dealloc {
	[txtLabel release];
    [super dealloc];
}


@end
