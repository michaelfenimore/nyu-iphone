//
//  GinzaAppDelegate.h
//  Ginza
//
//  Created by Michael Fenimore on 8/1/11.
//  Copyright 2011 --MichaelFenimore--. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StationController;

@interface GinzaAppDelegate : NSObject <UIApplicationDelegate> {
	NSArray *stationNames;
	NSArray *stationImages;
	UINavigationController *controller;
	NSMutableArray *a;
    UIWindow *window;
}

- (void) nextStation;

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

