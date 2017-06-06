//
//  View.m
//  DatePicker
//
//  Created by Computer Lab 1040 on 07/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "View.h"


@implementation View


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		self.backgroundColor = [UIColor whiteColor];
		
		//Let the date picker assume its natural size.
		picker = [[UIDatePicker alloc] initWithFrame: CGRectZero];
		picker.datePickerMode = UIDatePickerModeDate;
		
		//Center the picker in the DatePickerView.
		CGRect b = self.bounds;
		
		picker.center = CGPointMake(
									b.origin.x + b.size.width / 2,
									b.origin.y + b.size.height / 2
									);
		
		[picker addTarget: self
					//Sends a setNeedsDisplay when the user is done selecting (automatic)
				   action: @selector(setNeedsDisplay)
		 forControlEvents: UIControlEventValueChanged
		 ];
		
		[self addSubview: picker];
		
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
	NSString *s = picker.date.description;
	UIFont *f = [UIFont systemFontOfSize: 24];	
	CGSize size = [s sizeWithFont: f];
	
	//Draw the string above the picker.
	CGRect b = self.bounds;
	CGFloat x = b.origin.x + (b.size.width - size.width) / 2;
	CGFloat y = b.origin.y + b.size.height / 2 - size.height;
	CGPoint p = CGPointMake(x, y - picker.bounds.size.height / 2);
	
	[s drawAtPoint: p withFont: f];	
}

- (void)dealloc {
	[picker release];
    [super dealloc];
}


@end
