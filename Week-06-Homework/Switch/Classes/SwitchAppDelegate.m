//
//  SwitchAppDelegate.m
//  Switch
//
//  Created by Michael Fenimore on 7/20/11.
//  Copyright 2011 --MichaelFenimore--. All rights reserved.
//

#import "SwitchAppDelegate.h"
#import "View.h"

@implementation SwitchAppDelegate
@synthesize window;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
    
	//Get Audio file location and prepare to play on screen touch.
	NSBundle *bundle = [NSBundle mainBundle];
	if (bundle == nil) {
		NSLog(@"Not Able to get Bundle Path: \"%@\"", bundle);
	}
	
	NSString *audioPath = [bundle pathForResource: @"musette" ofType: @"mp3"];
	if (audioPath == nil) {
		NSLog(@"Not Able to get Audio Path: \"%@\"", audioPath);
	}
	
	NSURL *audioURL = [NSURL fileURLWithPath:audioPath isDirectory: NO];
	if (audioURL == nil) {
		NSLog(@"Audio URL: \"%@\"", audioURL);
	}
	
	NSError *error = nil;
	player = [[AVAudioPlayer alloc] initWithContentsOfURL: audioURL error: &error];
	
	if (player == nil) {
		NSLog(@"Could not initialize player:  %@", error);
		[error release];
	} else {
		player.volume = 1.0;		//the default
		player.numberOfLoops = 1;	//negative for infinite loop
		[player setDelegate: self];
		//mono or stereo
		NSLog(@"Number of channels == %u", player.numberOfChannels);
		
		if (![player prepareToPlay]) {
			NSLog(@"Could not prepare to play");
		}
	}
	
	UIScreen *s = [UIScreen mainScreen];
	myView = [[View alloc] initWithFrame: s.applicationFrame];
	window = [[UIWindow alloc] initWithFrame: s.bounds];
	
	[window addSubview: myView];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void) audioPlayerDidFinishPlaying: (AVAudioPlayer *) p successfully: (BOOL) flag {
	if (p == player) {
		[myView.mySwitch01 setOn: NO animated: YES];	//Go back to the OFF position.
		[myView.mySwitch02 setOn: NO animated: YES];	//Go back to the OFF position.
		[myView.mySwitch03 setOn: NO animated: YES];	//Go back to the OFF position.
		[myView.mySwitch04 setOn: NO animated: YES];	//Go back to the OFF position.
		[myView.mySwitch05 setOn: NO animated: YES];	//Go back to the OFF position.
	}
}

- (void)valueChanged:(id)sender {
	UISwitch *mySwitch = sender;
	if (mySwitch.isOn) {
		//The switch has just been turned on.
		if (![player play]) {
			NSLog(@"[Player play] failed.");
		}
	} else {
		//The switch has just been turned off.
		[player pause];
		NSLog(@"Paused at %g seconds.", player.currentTime);
	}
}

- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
	[player release];
	[myView release];
    [window release];
    [super dealloc];
}


@end
