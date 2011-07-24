//
//  View.h
//  ViewController
//
//  Created by Computer Lab 1040 on 07/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ViewController;


@interface View : UIView {
	ViewController *viewController;
}

- (id) initWithFrame: (CGRect) frame controller: (ViewController *) c;

@end
