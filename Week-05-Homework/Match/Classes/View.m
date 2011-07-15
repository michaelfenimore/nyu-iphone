//
//  View.m
//  Match
//
//  Created by Fenimore, Michael on 7/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "View.h"
#import	"TileView.h"

@implementation View
@synthesize row;
@synthesize column;


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
		self.backgroundColor = [UIColor whiteColor];
		
		//Put the origin of the View at the center of the View.
		CGSize theScreen = self.bounds.size;
		self.bounds = CGRectMake(
								 -theScreen.width / 2,
								 -theScreen.height / 2,
								 theScreen.width,
								 theScreen.height
								 );
		NSLog(@"Bounds: %u, %u", theScreen);
		
		row = 3;
		column = 4;
		
		set = [NSSet setWithObjects:
			   [[TileView alloc] initWithView: self row: 0 column: 0],
			   [[TileView alloc] initWithView: self row: 0 column: 1],
			   [[TileView alloc] initWithView: self row: 0 column: 2],
			   
			   [[TileView alloc] initWithView: self row: 1 column: 0],
			   [[TileView alloc] initWithView: self row: 1 column: 1],
			   [[TileView alloc] initWithView: self row: 1 column: 2],
			   
			   [[TileView alloc] initWithView: self row: 2 column: 0],
			   [[TileView alloc] initWithView: self row: 2 column: 1],
			   [[TileView alloc] initWithView: self row: 2 column: 2],
			   
			   [[TileView alloc] initWithView: self row: 3 column: 0],
			   [[TileView alloc] initWithView: self row: 3 column: 1],
			   [[TileView alloc] initWithView: self row: 3 column: 2],
			   nil
			   ];
		[set retain];
		
		for (TileView *pictures in set) {
			[self addSubview:pictures];
		}
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
	for (TileView *pictures in set) {
		[pictures release];
	}
	[set release];
    [super dealloc];
}


@end
