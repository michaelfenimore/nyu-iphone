//
//  LTrainAppDelegate.h
//  LTrain
//
//  Created by scholar on 7/14/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StationController;

@interface LTrainAppDelegate : NSObject <UIApplicationDelegate> {
	NSArray *names;
	NSDictionary *information;
	UINavigationController *controller;
	NSMutableArray *a;
	UIWindow *window;
}

- (void) nextStation;
- (void) moreInfo: (StationController *) sc;

@property (nonatomic, retain) IBOutlet UIWindow *window;
@end

