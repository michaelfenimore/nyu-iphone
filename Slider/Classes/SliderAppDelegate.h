//
//  SliderAppDelegate.h
//  Slider
//
//  Created by Computer Lab 1040 on 07/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class View;

@interface SliderAppDelegate : NSObject <UIApplicationDelegate> {
	View *myView;
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end