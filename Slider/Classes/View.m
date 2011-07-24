//
//  View.m
//  Slider
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
		minimumValue = 32;	//freezing point of water in Fahrenheit
		maximumValue = 212;
		value = (minimumValue + maximumValue) / 2;
		
		//Center the slider in the View.
		CGRect b = self.bounds;
		CGSize s = CGSizeMake(212 - 32, 16);	//size of slider
		
		CGRect f = CGRectMake(
							  b.origin.x + (b.size.width - s.width) / 2,
							  b.origin.y + (b.size.height - s.height) / 2,
							  s.width,
							  s.height
							  );
		
		slider = [[UISlider alloc] initWithFrame: f];
		slider.minimumValue = minimumValue;
		slider.maximumValue = maximumValue;
		slider.value = value;
		slider.continuous = YES;	//the default
		
		CGFloat red = (slider.value - slider.minimumValue)
		/ (slider.maximumValue - slider.minimumValue);
		
		slider.backgroundColor = [UIColor colorWithRed:red green: 0.0 blue:1.0 - red alpha:1.0];
		
		[slider addTarget:self
				   action:@selector(valueChanged:)
		 forControlEvents:UIControlEventValueChanged];
		
		[self addSubview: slider];
		
    }
    return self;
}

- (void) valueChanged: (id) sender {
	if (sender == slider) {
		
		//red goes from 0 to 1 as slider.value goes from 32 to 212.
		//Conversely, the expression 1.0 - red goes from 1 to 0
		//as slider.value goes form 32 to 212.
		CGFloat red = (slider.value - slider.minimumValue)
		/ (slider.maximumValue - slider.minimumValue);
		
		slider.backgroundColor = [UIColor colorWithRed:red green:0.0 blue:1.0 - red alpha:1.0];
		//90 degrees counterclockwise
		slider.transform = CGAffineTransformMakeRotation(-90 * M_PI / 180);

		[self setNeedsDisplay];
	}
}

//Macro to convert fahrenheit to celsius.
#define CELSIUS(fahrenheit) (((fahrenheit) - 32.0) * 100 / (212 - 32))


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void) drawRect: (CGRect) rect {
		// Drawing code
		//The format %.1 prints one digit to right of decimal point.
		//Degree symbol: Edit -> Special Characters... -> Punctuation -> Unicode 00B0
		//Use a monospace font to keep the strings from shifting on the screen
		NSString *s = [NSString stringWithFormat: @"%5.1f° F == %5.1f° C",
					   slider.value, CELSIUS(slider.value)];
		
		UIFont *f = [UIFont systemFontOfSize: 32];
		CGSize size = [s sizeWithFont: f];
		
		//Draw the string one line above the center of self.bounds.
		CGRect b = self.bounds;
		CGFloat x = b.origin.x + (b.size.width - size.width) / 2;
		CGFloat y = b.origin.y + (b.size.height - size.height) / 2;
		CGPoint p = CGPointMake(x, y - size.height);
		
		[s drawAtPoint: p withFont: f];	
	}

- (void)dealloc {
	[slider release];
    [super dealloc];
}


@end
