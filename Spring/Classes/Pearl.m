//
//  Pearl.m
//  Spring
//
//  Created by Computer Lab 1040 on 07/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Pearl.h"


@implementation Pearl
@synthesize location;

- (id) initWithLocation: (CGPoint) p {
	
	if ((self = [super init]) != nil) {
		location = p;
		velocity = CGPointZero;
	}
	return self;
}

//Drag the Pearl towrds point p.

- (void) drag: (CGPoint) p {
	static const float stiffness = 0.2;
	static const float gravity = 3;
	static const float mass = 2;	//must be positive
	static const float damping = 0.7;
	static const float radius = 20;	//in pixels
	
	CGPoint force = CGPointMake(
								(p.x - location.x) * stiffness,
								(p.y - location.y) * stiffness + gravity * mass
								);
	
	CGPoint acceleration = CGPointMake(
									   force.x / mass,
									   force.y / mass
									   );
	
	velocity = CGPointMake(
						   damping * (velocity.x + acceleration.x),
						   damping * (velocity.y + acceleration.y)
						   );
	
	location = CGPointMake(
						   location.x + velocity.x,
						   location.y + velocity.y
						   );
	
	CGRect rect = CGRectMake(
							 location.x - radius,
							 location.y - radius,
							 2 * radius,
							 2 * radius
							 );
	
	CGContextRef c = UIGraphicsGetCurrentContext();
	
	CGContextBeginPath(c);
	CGContextAddEllipseInRect(c, rect);
	CGContextSetRGBFillColor(c, 1, 1, 1, 1);	//white, opaque
	CGContextFillPath(c);
	
	CGContextBeginPath(c);
	CGContextMoveToPoint(c, location.x, location.y);
	CGContextAddLineToPoint(c, p.x, p.y);
	CGContextSetRGBStrokeColor(c, 1, 1, 1, 1);
	CGContextStrokePath(c);
}


@end
