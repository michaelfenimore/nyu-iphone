//
//  SpringAppDelegate.h
//  Spring
//
//  Created by Computer Lab 1040 on 07/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SpringViewController;

@interface SpringAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    SpringViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SpringViewController *viewController;

@end

