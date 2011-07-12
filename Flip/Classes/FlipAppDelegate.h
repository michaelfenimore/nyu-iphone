//
//  FlipAppDelegate.h
//  Flip
//
//  Created by Fenimore, Michael on 7/12/11.
//  Copyright 2011 --MichaelFenimore--. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BigView;

@interface FlipAppDelegate : NSObject <UIApplicationDelegate> {
	BigView *bigView;
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

