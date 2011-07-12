//
//  LittleView1.m
//  Flip
//
//  Created by Fenimore, Michael on 7/12/11.
//  Copyright 2011 --MichaelFenimore--. All rights reserved.
//

#import "LittleView1.h"


@implementation LittleView1


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
		self.backgroundColor = [UIColor blueColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
	UIFont *myFont = [UIFont systemFontOfSize:32];
	[@"LittleView1" drawAtPoint:CGPointZero withFont:myFont];
}
	 
- (void) dealloc {
    [super dealloc];
}


@end
