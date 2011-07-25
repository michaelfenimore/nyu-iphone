//
//  main.m
//  Pong
//
//  Created by Michael Fenimore on 7/24/11.
//  Copyright 2011 -MichaelFenimore--. All rights reserved.
//

#import <UIKit/UIKit.h>

int main(int argc, char *argv[]) {
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, @"PongAppDelegate");
    [pool release];
    return retVal;
}