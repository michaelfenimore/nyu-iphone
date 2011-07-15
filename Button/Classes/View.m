//
//  View.m
//  Button
//
//  Created by Computer Lab 1040 on 07/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "View.h"

@implementation View

- (id)initWithFrame:(CGRect)frame {
    
    if ((self = [super initWithFrame: frame]) != nil) {
		// Initialization code
		self.backgroundColor = [UIColor whiteColor];
		
		//Center the button in the view.
		CGRect b = self.bounds;
		CGSize s = CGSizeMake(200, 40);	//size of button
		
		CGRect f = CGRectMake(
							  b.origin.x + (b.size.width - s.width) / 2,
							  b.origin.y + (b.size.height - s.height) / 2,
							  s.width,
							  s.height
							  );
		
		myButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
		[myButton retain];
		myButton.frame = f;
		
		[myButton setTitleColor: [UIColor redColor] forState: UIControlStateNormal];
		[myButton setTitle: @"Chinese sound effect" forState: UIControlStateNormal];
		
		//Allows you to communicate with the Applications Delegate (UIApplication sharedApplication)
		[myButton addTarget: [UIApplication sharedApplication].delegate
				   action: @selector(touchUpInside:)
		 forControlEvents: UIControlEventTouchUpInside
		 ];
		
		[self addSubview: myButton];
	}
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/

- (void)dealloc {
	[myButton release];
    [super dealloc];
}


@end
