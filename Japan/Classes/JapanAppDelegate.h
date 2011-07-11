//
//  JapanAppDelegate.h
//  Japan
//
//  Created by Fenimore, Michael on 6/24/11.
//  Copyright 2011 __MichaelFenimore__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class View;

@interface JapanAppDelegate : NSObject <UIApplicationDelegate> {
	View *view;
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end