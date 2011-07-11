//
//  main.m
//  Pinch
//
//  Created by Michael Fenimore on 7/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

int main(int argc, char *argv[]) {
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, @"PinchAppDelegate");
    [pool release];
    return retVal;
}