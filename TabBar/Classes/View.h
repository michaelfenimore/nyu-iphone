//
//  View.h
//  TabBar
//
//  Created by NYU User on 12/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ViewController;


@interface View: UIView {
	ViewController *viewController;
}

- (id) initWithFrame: (CGRect) frame controller: (ViewController *) c;
@end
