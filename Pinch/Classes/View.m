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
	UIFont *theFont = [UIFont systemFontOfSize: currentDistance / 2];
	CGSize size = [myString sizeWithFont: theFont];
	CGRect b = self.bounds;
	CGFloat x = b.origin.x + (b.size.width - size.width) / 2;
	
	[myString drawAtPoint: CGPointMake(x, 0.0) withFont: theFont];

}

- (void)dealloc {
    [super dealloc];
}


@end
