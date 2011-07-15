//
//  LittleView2.m
//  Flip
//
//  Created by Fenimore, Michael on 7/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LittleView2.h"


@implementation LittleView2


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
		self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"king.png"]];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
	UIFont *myFont = [UIFont systemFontOfSize:12];
	[@"View2" drawAtPoint:CGPointZero withFont:myFont];
}

- (void)dealloc {
    [super dealloc];
}


@end
