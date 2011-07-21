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
	
	NSString *audioPath1 = [bundle pathForResource: @"get_off_bridge" ofType: @"mp3"];
	NSString *audioPath2 = [bundle pathForResource: @"beam_scotty" ofType: @"mp3"];
	NSString *audioPath3 = [bundle pathForResource: @"soundtribble" ofType: @"mp3"];
	NSString *audioPath4 = [bundle pathForResource: @"fascinating" ofType: @"mp3"];
	NSString *audioPath5 = [bundle pathForResource: @"soundhug" ofType: @"mp3"];
//	if (audioPath1 == nil) {
//		NSLog(@"Not Able to get Audio Path: \"%@\"", audioPath1);
//	}
	
	NSURL *audioURL1 = [NSURL fileURLWithPath:audioPath1 isDirectory: NO];
	NSURL *audioURL2 = [NSURL fileURLWithPath:audioPath2 isDirectory: NO];
	NSURL *audioURL3 = [NSURL fileURLWithPath:audioPath3 isDirectory: NO];
	NSURL *audioURL4 = [NSURL fileURLWithPath:audioPath4 isDirectory: NO];
	NSURL *audioURL5 = [NSURL fileURLWithPath:audioPath5 isDirectory: NO];
//	if (audioURL1 == nil) {
//		NSLog(@"Audio URL: \"%@\"", audioURL1);
//	}
	
	NSError *error = nil;
	player1 = [[AVAudioPlayer alloc] initWithContentsOfURL: audioURL1 error: &error];
	player2 = [[AVAudioPlayer alloc] initWithContentsOfURL: audioURL2 error: &error];
	player3 = [[AVAudioPlayer alloc] initWithContentsOfURL: audioURL3 error: &error];
	player4 = [[AVAudioPlayer alloc] initWithContentsOfURL: audioURL4 error: &error];
	player5 = [[AVAudioPlayer alloc] initWithContentsOfURL: audioURL5 error: &error];
	
	if (player1 == nil || player2 == nil || player3 == nil || player4 == nil || player5 == nil) {
		NSLog(@"Could not initialize player:  %@", error);
		[error release];
	} else {
		player1.volume = 1.0;		//the default
		player1.numberOfLoops = 0;	//negative for infinite loop
		[player1 setDelegate: self];
		
		player2.volume = 1.0;		//the default
		player2.numberOfLoops = 0;	//negative for infinite loop
		[player2 setDelegate: self];
		
		player3.volume = 1.0;		//the default
		player3.numberOfLoops = 0;	//negative for infinite loop
		[player3 setDelegate: self];
		
		player4.volume = 1.0;		//the default
		player4.numberOfLoops = 0;	//negative for infinite loop
		[player4 setDelegate: self];
		
		player5.volume = 1.0;		//the default
		player5.numberOfLoops = 0;	//negative for infinite loop
		[player5 setDelegate: self];
		
		//mono or stereo
		//NSLog(@"Number of channels == %u", player1.numberOfChannels);
		
		if (![player1 prepareToPlay] || ![player2 prepareToPlay] || ![player3 prepareToPlay] ||
			![player4 prepareToPlay] || ![player5 prepareToPlay]) {
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
	if (p == player1) {
		[myView.mySwitch01 setOn: NO animated: YES];	//Go back to the OFF position.
	}
	if (p == player2) {
		[myView.mySwitch02 setOn: NO animated: YES];	//Go back to the OFF position.
	}
	if (p == player3) {
		[myView.mySwitch03 setOn: NO animated: YES];	//Go back to the OFF position.
	}
	if (p == player4) {
		[myView.mySwitch04 setOn: NO animated: YES];	//Go back to the OFF position.
	}
	if (p == player5) {
		[myView.mySwitch05 setOn: NO animated: YES];	//Go back to the OFF position.
	}
}

- (void)valueChanged1:(id)sender {
	UISwitch *mySwitch = sender;
	if (mySwitch.isOn) {
		//The switch has just been turned on.
		if (![player1 play]) {
			NSLog(@"[Player play] failed.");
		}
	} else {
		//The switch has just been turned off.
		[player1 pause];
		NSLog(@"Paused at %g seconds.", player1.currentTime);
	}
}

- (void)valueChanged2:(id)sender {
	UISwitch *mySwitch = sender;
	if (mySwitch.isOn) {
		//The switch has just been turned on.
		if (![player2 play]) {
			NSLog(@"[Player play] failed.");
		}
	} else {
		//The switch has just been turned off.
		[player2 pause];
		NSLog(@"Paused at %g seconds.", player2.currentTime);
	}
}

- (void)valueChanged3:(id)sender {
	UISwitch *mySwitch = sender;
	if (mySwitch.isOn) {
		//The switch has just been turned on.
		if (![player3 play]) {
			NSLog(@"[Player play] failed.");
		}
	} else {
		//The switch has just been turned off.
		[player3 pause];
		NSLog(@"Paused at %g seconds.", player3.currentTime);
	}
}

- (void)valueChanged4:(id)sender {
	UISwitch *mySwitch = sender;
	if (mySwitch.isOn) {
		//The switch has just been turned on.
		if (![player4 play]) {
			NSLog(@"[Player play] failed.");
		}
	} else {
		//The switch has just been turned off.
		[player4 pause];
		NSLog(@"Paused at %g seconds.", player4.currentTime);
	}
}

- (void)valueChanged5:(id)sender {
	UISwitch *mySwitch = sender;
	if (mySwitch.isOn) {
		//The switch has just been turned on.
		if (![player5 play]) {
			NSLog(@"[Player play] failed.");
		}
	} else {
		//The switch has just been turned off.
		[player5 pause];
		NSLog(@"Paused at %g seconds.", player5.currentTime);
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
	[player1 release];
	[myView release];
    [window release];
    [super dealloc];
}


@end
