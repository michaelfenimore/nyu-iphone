//
//  LittleView0.m
//  Flip
//
//  Created by Fenimore, Michael on 7/12/11.
//  Copyright 2011 --MichaelFenimore--. All rights reserved.
//

#import "LittleView0.h"


@implementation LittleView0


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
		self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"jack.png"]];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
	UIFont *myFont = [UIFont systemFontOfSize:12];
	[@"View0" drawAtPoint: CGPointZero withFont: myFont];
}

- (void)dealloc {
    [super dealloc];
}


@end
