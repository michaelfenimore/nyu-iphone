//
//  NavigateAppDelegate.h
//  Navigate
//
//  Created by Ann McDermott on 7/3/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavigateAppDelegate: NSObject <UIApplicationDelegate> {
	NSArray *names;
	UINavigationController *controller;
	NSMutableArray *a;
	UIWindow *window;
}

- (void) nextStation;

@property (nonatomic, retain) IBOutlet UIWindow *window;
@end

