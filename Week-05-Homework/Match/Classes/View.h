//
//  View.h
//  Match
//
//  Created by Fenimore, Michael on 7/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface View : UIView {
	NSUInteger row;		//Number of Rows
	NSUInteger column;	//Number of Columns
	NSSet *set;			// Pointers to the row*row-1 TileViews
}

@property (nonatomic, assign) NSUInteger row;
@property (nonatomic, assign) NSUInteger column;

@end
