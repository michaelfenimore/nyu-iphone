//
//  Pearl.h
//  Spring
//
//  Created by Computer Lab 1040 on 07/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Pearl : NSObject {
	CGPoint location;
	CGPoint velocity;
}

- (id) initWithLocation: (CGPoint) p;
- (void) drag: (CGPoint) p;

@property (nonatomic, assign) IBOutlet CGPoint location;

@end