//
//  MatchAppDelegate.h
//  Match
//
//  Created by Fenimore, Michael on 7/14/11.
//  Copyright 2011 --MichaelFenimore--. All rights reserved.
//

#import <UIKit/UIKit.h>
@class View;

@interface MatchAppDelegate : NSObject <UIApplicationDelegate> {
	View *myView;
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

