//
//  nibAppDelegate.h
//  nib
//
//  Created by Computer Lab 1040 on 08/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ViewController;

@interface nibAppDelegate : NSObject <UIApplicationDelegate> {
    ViewController *viewController;
	UIWindow *window;
}
@property (nonatomic, retain) IBOutlet ViewController *viewController;
@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

