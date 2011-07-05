//
//  Week_03_HomeworkAppDelegate.h
//  Week-03-Homework
//
//  Created by Michael Fenimore on 6/25/11.
//  Copyright 2011 __MichaelFenmore__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class myView;

@interface Week_03_HomeworkAppDelegate : NSObject <UIApplicationDelegate> {
	myView *view;
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end