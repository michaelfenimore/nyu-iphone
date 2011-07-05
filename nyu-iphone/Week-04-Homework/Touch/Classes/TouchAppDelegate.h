//
//  TouchAppDelegate.h
//  Touch
//
//  Created by Fenimore, Michael on 7/1/11.
//  Copyright 2011 MichaelFenimore. All rights reserved.
//

#import <UIKit/UIKit.h>
@class View;

@interface TouchAppDelegate : NSObject <UIApplicationDelegate> {
	View *myView;
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

