//
//  NotificationAppDelegate.h
//  Notification
//
//  Created by Computer Lab 1040 on 07/14/11.
//  Copyright 2011 --MichaelFenimore--. All rights reserved.
//

#import <UIKit/UIKit.h>
@class View;

@interface NotificationAppDelegate : NSObject <UIApplicationDelegate> {
	UIDevice *device;
	View *myView;
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end