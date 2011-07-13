//
//  BigView.m
//  Flip
//
//  Created by Fenimore, Michael on 7/12/11.
//  Copyright 2011 --MichaelFenimore--. All rights reserved.
//

#import "BigView.h"
#import "LittleView0.h"
#import "LittleView1.h"
#import "LittleView2.h"


@implementation BigView


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
		//Don't bother with a background color--
		//this BigView is entirely occupied by a LittleView.
		
		views = [NSArray arrayWithObjects:
				 [[LittleView0 alloc] initWithFrame: self.bounds],
				 [[LittleView1 alloc] initWithFrame: self.bounds],
				 [[LittleView2 alloc] initWithFrame: self.bounds],
				 nil
				 ];
		
		[views retain];
		index = 0;	//LittleView0 is the one that's initially visible.
		[self addSubview: [views objectAtIndex: index]];
		
		pointBegan = CGPointZero;
		pointMoved = CGPointZero;
    }
    return self;
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *t = [touches anyObject];
	pointBegan = [t locationInView:self];
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *t = [touches anyObject];
	pointMoved = [t locationInView:self];
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	/*
	 Assume a swipe has just ended.  A more complicated program could
	 distinguish between left vs. rightswipes, and perform a
	 UIViewAnimationOptionTransitionFlipFromLeft or a
	 UIViewAnimationOptionTransitionFlipFromRight.
	 
	 In UIViewAnimationOptionTransitionFlipFromLeft, the left edge moves
	 to the right, and the right edge moves away from the user and to the
	 left.
	 */
	
	CGFloat horizontal = pointMoved.x - pointBegan.x;
	CGFloat vertical = pointMoved.y - pointBegan.y;
	CGFloat angle = atan2f(-vertical, horizontal) * 180 / M_PI;
	NSInteger newIndex = 0;
	//Declare variable for Options transition
	UIViewAnimationOptions transitionEffect;
	
	if (angle <= -135) {
		transitionEffect = UIViewAnimationOptionTransitionFlipFromRight;
		newIndex = index + 1;
	} else if (angle <= -45) {
		transitionEffect = UIViewAnimationOptionTransitionCurlDown;
		newIndex = index - 1;
	} else if (angle <= 45) {
		transitionEffect = UIViewAnimationOptionTransitionFlipFromLeft;
		newIndex = index - 1;
	} else if (angle <= 135) {
		transitionEffect = UIViewAnimationOptionTransitionCurlUp;
		newIndex = index + 1;
	} else {
		transitionEffect = UIViewAnimationOptionTransitionFlipFromRight;
		newIndex = index + 1;
	}

	if (newIndex == 3) {
		newIndex = 0;
	}else if (newIndex < 0) {
		newIndex = 2;
	}

	NSLog(@"NewIndex:%d  Index:%d", newIndex, index);
	[UIView transitionFromView: [views objectAtIndex: index]
						toView: [views objectAtIndex: newIndex]
					  duration: 2
					   options: transitionEffect
					completion: NULL
	 ];
	
	index = newIndex;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/

- (void)dealloc {
	for (UIView *v in views) {
		[v release];
	}
	
	[views release];
    [super dealloc];
}


@end
