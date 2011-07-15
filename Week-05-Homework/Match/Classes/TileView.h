//
//  TileView.h
//  Match
//
//  Created by Fenimore, Michael on 7/14/11.
//  Copyright 2011 --MichaelFenimore--. All rights reserved.
//

#import <UIKit/UIKit.h>
@class View;

@interface TileView : UIImageView {
	View *myView;
	NSUInteger row;
	NSUInteger column;
	UIView *myImage;
}

-(id) initWithView:(View *)v row:(NSUInteger)r column:(NSUInteger)c;

@end