//
//  PongAppDelegate.h
//  Pong
//
//  Created by Michael Fenimore on 7/24/11.
//  Copyright 2011 -MichaelFenimore--. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PongViewController;

@interface PongAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    PongViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet PongViewController *viewController;

@end

