//
//  MainView.h
//  Modal
//
//  Created by scholar on 3/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MainViewController;

@interface MainView: UIView {
	MainViewController *controller;
}

- (id) initWithFrame: (CGRect) frame controller: (MainViewController *) c;
@end
