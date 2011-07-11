//
//  View.m
//  Tap
//
//  Created by Michael Fenimore on 7/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "View.h"


@implementation View


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
		tapCount = 0;
		wearOff = 2;
    }
    return self;
}

- (void) noTap {
	tapCount = 0;
	[self setNeedsDisplay];
}

- (void) singleTap {
	tapCount = 1;
	[self setNeedsDisplay];
	
	//After a few milliseconds the single tap will wear off
	[self performSelector: @selector(noTap) withObject: nil afterDelay: wearOff];
}

-(void) doubleTap {
	tapCount = 2;
	[self setNeedsDisplay];
	
	//After a few milliseconds the double tap wears off
	[self performSelector: @selector(noTap) withObject: nil afterDelay: wearOff];
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	NSAssert1(touches.count > 0, @"touchesBegan: touches.count == %u", touches.count);
	
	UITouch *myTouch = [touches anyObject];
	
	if (myTouch.tapCount == 1) {
		[self performSelector: @selector(singleTap) withObject: nil afterDelay: 0.3];
	} else if (myTouch.tapCount == 2) {
		[self doubleTap];
	}
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	NSAssert1(touches.count > 0, @"touchesBegan: touches.count == %u", touches.count);
	
	UITouch *myTouch = [touches anyObject];
	
	if (myTouch.tapCount == 2) {
		[NSObject cancelPreviousPerformRequestsWithTarget: self];
	}
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
	NSString *myString = [NSString stringWithFormat: @"%u", tapCount];
	UIFont *myFont = [UIFont systemFontOfSize: 5 * 72];
	CGSize size = [myString sizeWithFont: myFont];
	
	CGRect theBounds = self.bounds;
	CGFloat x = theBounds.origin.x + (theBounds.size.width - size.width) / 2;
	CGFloat y = theBounds.origin.y + (theBounds.size.height - size.height) / 2;
	[myString drawAtPoint:CGPointMake(x, y) withFont:myFont];
}

- (void)dealloc {
    [super dealloc];
}


@end
