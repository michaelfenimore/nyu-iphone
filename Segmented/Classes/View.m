//
//  View.m
//  Segmented
//
//  Created by Computer Lab 1040 on 07/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "View.h"


@implementation View

@synthesize control;


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		self.backgroundColor = [UIColor whiteColor];
		
		//Create the segmented control.
		
		NSArray *items = [NSArray arrayWithObjects:
						  @"Record",
						  @"Stop",
						  @"Play",
						  nil
						  ];
		
		control = [[UISegmentedControl alloc] initWithItems: items];
		control.segmentedControlStyle = UISegmentedControlStylePlain;	//default
		control.momentary = NO;		//default
		
		//Can't play until we have recorded something.
		[control setEnabled: NO forSegmentAtIndex: 2];
		
		//Center the control in the SegmentedView.
		CGRect b = self.bounds;
		
		control.center = CGPointMake(
									 b.origin.x + b.size.width / 2,
									 b.origin.y + b.size.height / 2
									 );
		
		[control addTarget: [UIApplication sharedApplication].delegate
					action: @selector(valueChanged:)
		  forControlEvents: UIControlEventValueChanged
		 ];
		
		[self addSubview: control];
		
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
	[control release];
    [super dealloc];
}


@end
