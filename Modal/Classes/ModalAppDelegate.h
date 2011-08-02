//
//  ModalAppDelegate.h
//  Modal
//
//  Created by scholar on 3/29/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MainViewController;

@interface ModalAppDelegate: NSObject <UIApplicationDelegate> {
	MainViewController *controller;
	UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@end
