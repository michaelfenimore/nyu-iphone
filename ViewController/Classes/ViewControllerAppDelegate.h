//
//  ViewControllerAppDelegate.h
//  ViewController
//
//  Created by Computer Lab 1040 on 07/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface ViewControllerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ViewController *viewController;
	//UITabBarController *tabBarController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ViewController *viewController;

@end

