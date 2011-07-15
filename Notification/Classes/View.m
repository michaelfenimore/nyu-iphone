//
//  View.m
//  Notification
//
//  Created by Computer Lab 1040 on 07/14/11.
//  Copyright 2011 --MichaelFenimore--. All rights reserved.
//

#import "View.h"


@implementation View


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
		self.backgroundColor = [UIColor yellowColor];
    }
    return self;
}

// not needed as added to the selector in NotificationAppDelegate.m
//- (void) orientationChanged: (NSNotification *) n {
//	[self setNeedsDisplay];	//calls drawRect:
//}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
	NSArray *a = [NSArray arrayWithObjects:
				  @"Unknown",
				  @"Portrait",
				  @"PortraitUpsideDown",
				  @"LandscapeRight",	//home button on right
				  @"LandscapeLeft",	//home button on left
				  @"FaceUp",
				  @"FaceDown",
				  nil
				  ];
	
	NSString *s = [a objectAtIndex: [UIDevice currentDevice].orientation];
	UIFont *fontSize = [UIFont systemFontOfSize: 32.0];
	CGPoint p = CGPointZero;
	[s drawAtPoint: p withFont: fontSize];
}

- (void)dealloc {
    [super dealloc];
}


@end
