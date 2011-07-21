//
//  View.m
//  Switch
//
//  Created by Michael Fenimore on 7/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "View.h"


@implementation View
@synthesize mySwitch01;
@synthesize mySwitch02;
@synthesize mySwitch03;
@synthesize mySwitch04;
@synthesize mySwitch05;


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
		self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"nightsky.png"]];
		
//		NSArray *boroughs = [NSArray arrayWithObjects:
//							 @"Bronx",
//							 @"Brooklyn",
//							 @"Manhattan",
//							 @"Queens",
//							 @"Staten Island",
//							 nil
//							 ];
//		
//		NSUInteger c = boroughs.count;	//or [boroughs count]
//		NSLog(@"boroughs.count == %u", c);
//		
//		for (NSString *borough in boroughs) {
//			NSLog(@"%@", borough);	//in alphabetical order
//		}
//		
//		if (c > 0) {
//			NSLog(@"The first borough is %@.", [boroughs objectAtIndex: 0]);
//			NSLog(@"The last borough is %@.", [boroughs lastObject]);
//		}
		
		mySwitch01 = [[UISwitch alloc] initWithFrame: CGRectZero];
		mySwitch02 = [[UISwitch alloc] initWithFrame: CGRectZero];
		mySwitch03 = [[UISwitch alloc] initWithFrame: CGRectZero];
		mySwitch04 = [[UISwitch alloc] initWithFrame: CGRectZero];
		mySwitch05 = [[UISwitch alloc] initWithFrame: CGRectZero];
		
		mySwitch01.on = NO;	//the default
		mySwitch02.on = NO;	//the default
		mySwitch03.on = NO;	//the default
		mySwitch04.on = NO;	//the default
		mySwitch05.on = NO;	//the default
		
		[mySwitch01 addTarget: [UIApplication sharedApplication].delegate
					 action: @selector(valueChanged:)
		   forControlEvents: UIControlEventValueChanged
		 ];
		
		[mySwitch02 addTarget: [UIApplication sharedApplication].delegate
					   action: @selector(valueChanged:)
			 forControlEvents: UIControlEventValueChanged
		 ];
		
		[mySwitch03 addTarget: [UIApplication sharedApplication].delegate
					   action: @selector(valueChanged:)
			 forControlEvents: UIControlEventValueChanged
		 ];
		
		[mySwitch04 addTarget: [UIApplication sharedApplication].delegate
					   action: @selector(valueChanged:)
			 forControlEvents: UIControlEventValueChanged
		 ];
		
		[mySwitch05 addTarget: [UIApplication sharedApplication].delegate
					   action: @selector(valueChanged:)
			 forControlEvents: UIControlEventValueChanged
		 ];
		
		//Center the switch in the SwitchView.
		CGRect b = self.bounds;
		
		mySwitch01.center = CGPointMake(
									  b.origin.x + b.size.width / 2,
									  b.origin.y + b.size.height / 2
									  );
		
		NSLog(@"mySwitch.frame == (%g, %g), %g × %g",
			  mySwitch01.frame.origin.x,
			  mySwitch01.frame.origin.y,
			  mySwitch01.frame.size.width,
			  mySwitch01.frame.size.height
			  );
		
		[self addSubview: mySwitch01];
		[self addSubview: mySwitch02];
		[self addSubview: mySwitch03];
		[self addSubview: mySwitch04];
		[self addSubview: mySwitch05];
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
	[mySwitch01 release];
	[mySwitch02 release];
	[mySwitch03 release];
	[mySwitch04 release];
	[mySwitch05 release];
    [super dealloc];
}


@end
