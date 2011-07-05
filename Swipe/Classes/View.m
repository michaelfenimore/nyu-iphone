//
//  View.m
//  Swipe
//
//  Created by Fenimore, Michael on 7/5/11.
//  Copyright 2011 --MichaelFenimore--. All rights reserved.
//

#import "View.h"

@implementation View


- (id)initWithFrame:(CGRect)frame {
    //Is it safe to say that variables declared in here are Global (pointBegan, pointMoved)
	//as they do not need to be declared but something like UITouch *myTouch = [touches anyObject] does?
    if ((self = [super initWithFrame: frame]) != nil) {
		// Initialization code
		self.backgroundColor = [UIColor yellowColor];
		pointBegan = CGPointZero;
		pointMoved = CGPointZero;
	}
	return self;
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	NSAssert1(touches.count > 0, @"touchesBegan:withEvent: touches.count == %u", touches.count);
	
	UITouch *myTouch = [touches anyObject];
	pointBegan = [myTouch locationInView:self];
	timeBegan = myTouch.timestamp;
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	NSAssert1(touches.count > 0, @"touchesMoved:withEvent: touches.count == %u", touches.count);
	UITouch *myTouch = [touches anyObject];
	pointMoved = [myTouch locationInView:self];
	timeMoved = myTouch.timestamp;
	[self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    //All the infomraiton we need for the application.
	CGFloat horizontal = pointMoved.x - pointBegan.x;
	CGFloat vertical = pointMoved.y - pointBegan.y;
	CGFloat	distance = hypot(horizontal, vertical);
	CGFloat angle = atan2(-vertical, horizontal) * 180/M_PI;
	CGFloat duration = timeMoved - timeBegan;
	
	UIFont	*myFont = [UIFont systemFontOfSize:18];
	CGPoint startPoint = CGPointMake(5, 0);

	NSString *outputString = [NSString stringWithFormat:@"Start: (%g, %g)", pointBegan.x,pointBegan.y];
	[outputString drawAtPoint: startPoint withFont: myFont];
	
	//Gets the width and height of the NSString. Will change based on font size. Usefull to center text
	//and render multiple lines of text dynamically.
	CGSize size = [outputString sizeWithFont: myFont];
	
	outputString = [NSString stringWithFormat:@"Horizontal Distance: %g pixels", horizontal];
	startPoint = CGPointMake(startPoint.x, startPoint.y + size.height);
	[outputString drawAtPoint: startPoint withFont:myFont];
	
	outputString = [NSString stringWithFormat:@"Vertical Distance: %g pixels", vertical];
	startPoint = CGPointMake(startPoint.x, startPoint.y + size.height);
	[outputString drawAtPoint: startPoint withFont:myFont];
	
	outputString = [NSString stringWithFormat:@"Total distance: %g pixels", distance];
	startPoint = CGPointMake(startPoint.x, startPoint.y + size.height);
	[outputString drawAtPoint: startPoint withFont:myFont];
	
	outputString = [NSString stringWithFormat:@"Angle: %g pixels", angle];
	startPoint = CGPointMake(startPoint.x, startPoint.y + size.height);
	[outputString drawAtPoint: startPoint withFont:myFont];
	
	outputString = [NSString stringWithFormat:@"Duration: %g pixels", duration];
	startPoint = CGPointMake(startPoint.x, startPoint.y + size.height);
	[outputString drawAtPoint: startPoint withFont:myFont];
	
	if (duration != 0) {
		outputString = [NSString stringWithFormat: @"Speed: %g pixels per second", distance/duration];
		startPoint = CGPointMake(startPoint.x, startPoint.y + size.height);
		[outputString drawAtPoint: startPoint withFont:myFont];
	}
	
	if (distance < 50) {
		outputString = @"Too short to be a swipe";
	} else if (angle <= -135) {
		outputString = @"swipe ←";
	} else if (angle <= -45) {
		outputString = @"swipe ↓";
	} else if (angle <= 45) {
		outputString = @"swipe →";
	} else if (angle <= 135) {
		outputString = @"swipe ↑";
	} else {
		outputString = @"swipe ←";
	}
	
	outputString = [NSString stringWithFormat: @"Conclusion: %@", outputString];
	startPoint = CGPointMake(startPoint.x, startPoint.y + size.height);
	[outputString drawAtPoint: startPoint withFont:myFont];
}

- (void)dealloc {
    [super dealloc];
}


@end
