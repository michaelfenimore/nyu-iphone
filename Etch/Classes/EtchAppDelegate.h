//
//  EtchAppDelegate.h
//  Etch
//
//  Created by Computer Lab 1040 on 07/14/11.
//  Copyright 2011 --Michael Fenimore--. All rights reserved.
//

#import <UIKit/UIKit.h>
@class View;

@interface EtchAppDelegate : NSObject <UIApplicationDelegate> {
	View *view;
	UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

