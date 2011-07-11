//
//  TapAppDelegate.h
//  Tap
//
//  Created by Michael Fenimore on 7/10/11.
//  Copyright 2011 --MichaelFenimore--. All rights reserved.
//

#import <UIKit/UIKit.h>
@class View;

@interface TapAppDelegate : NSObject <UIApplicationDelegate> {
	View *myView;
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

