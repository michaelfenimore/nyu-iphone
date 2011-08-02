//
//  TabBarAppDelegate.h
//  TabBar
//
//  Created by NYU User on 12/2/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabBarAppDelegate: NSObject <UIApplicationDelegate> {
	UITabBarController *tabBarController;
	UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@end

