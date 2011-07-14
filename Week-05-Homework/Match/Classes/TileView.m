//
//  TileView.m
//  Match
//
//  Created by Fenimore, Michael on 7/14/11.
//  Copyright 2011 --MichaelFenimore--. All rights reserved.
//

#import "TileView.h"
#import "View.h"


@implementation TileView


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
    }
    return self;
}

- (CGPoint) center {
	CGFloat margin = 1;	//in pixels between pieces
	//CGFloat half = (myView.row - 1) / 2;
	CGSize size = self.bounds.size;
	
	CGFloat x = (size.width  + margin) * (column - 1.0);
	CGFloat y = (size.height + margin) * (row - 1.5);
	
	NSLog(@"Column:  %d  Row:  %d  X: %g  Y: %g", column, row, x, y);
	return CGPointMake(x, y);
}

- (id) initWithView:(View *)v row:(NSUInteger)r column:(NSUInteger)c {
	
	NSString *fileName = [NSString stringWithFormat:@"%u%u.png", r, c];
	UIImage *image = [UIImage imageNamed: fileName];
	
	if (image == nil) {
		NSLog(@"Could not find file %u%u.png", r, c);
		return nil;
	}
	
	if ((self = [super initWithImage: image]) != nil) {
		myView = v;
		row = r;
		column = c;
		self.center = [self center];
		self.userInteractionEnabled = YES;
	}
	return self;
}


-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	[UIView animateWithDuration: 1.0
						  delay: 0.0
						options: UIViewAnimationOptionCurveLinear
					 animations: ^{
						 //image.transform = UIViewAnimationTransitionFlipFromRight;
					 }
					 completion: NULL
	 ]; 
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/

- (void)dealloc {
    [super dealloc];
}


@end
