//
//  SegmentedAppDelegate.m
//  Segmented
//
//  Created by Computer Lab 1040 on 07/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SegmentedAppDelegate.h"
#import "View.h"

@implementation SegmentedAppDelegate

@synthesize window;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
	
    //Create an audio session that will silence other applications,
	//except for telephone ringtones and Clock and Calendar alarms.
	
	session = [AVAudioSession sharedInstance];
	if (!session.inputIsAvailable) {
		NSLog(@"Device does not support audio input");
		return YES;
	}
	
	NSError *error = nil;
	if (![session setCategory: AVAudioSessionCategoryPlayAndRecord error: &error]) {
		NSLog(@"AVAudioSession setCategory: %@", error);
		[error release];
		return YES;
	}
	
	if (![session setActive: YES error: &error]) {
		NSLog(@"AVAudioSession setActive %@", error);
		[error release];
		return YES;
	}
	
	NSLog(@"currentHardwareInputNumberOfChannels == %d",
		  session.currentHardwareInputNumberOfChannels);
	NSLog(@"currentHardwareOutputNumberOfChannels == %d",
		  session.currentHardwareOutputNumberOfChannels);
	NSLog(@"currentHardwareSampleRate == %g",
		  session.currentHardwareSampleRate);
	NSLog(@"preferredHardwareSampleRate == %g",
		  session.preferredHardwareSampleRate);
	NSLog(@"preferredIOBufferDuration == %g",
		  session.preferredIOBufferDuration);
	
	//Create the audio recorder.
	
	NSString *filename = [NSTemporaryDirectory()
						  stringByAppendingPathComponent: @"recording.caf"];
	NSLog(@"filename == \"%@\"", filename);
	
	url = [NSURL fileURLWithPath: filename];
	[url retain];
	NSLog(@"url == \"%@\"", url);
	
	NSDictionary *settings = [NSDictionary dictionaryWithObjectsAndKeys:
							  [NSNumber numberWithInt: kAudioFormatAppleIMA4], AVFormatIDKey,
							  [NSNumber numberWithFloat: 44100.0],             AVSampleRateKey,
							  [NSNumber numberWithInt: 2],                     AVNumberOfChannelsKey,
							  nil
							  ];
	
	recorder = [[AVAudioRecorder alloc]
				initWithURL: url settings: settings error: &error];
	
	if (recorder == nil) {
		NSLog(@"AVAudioRecorder initWithURL:settings:error: %@", error);
		[error release];
		return YES;
	}
	
	recorder.delegate = self;
	
	UIScreen *s = [UIScreen mainScreen];
	view = [[View alloc] initWithFrame: s.applicationFrame];
	window = [[UIWindow alloc] initWithFrame: s.bounds];
	
	[window addSubview: view];
    [self.window makeKeyAndVisible];
    
    return YES;
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
#pragma mark Target of UISegmentedControl

- (void) valueChanged: (id) sender {
	UISegmentedControl *control = sender;
	
	switch ([control selectedSegmentIndex]) {
		case 0:	//Record
			if (![recorder prepareToRecord]) {
				NSLog(@"AVAudioRecorder prepareToRecord failed.");
			}
			
			if (![recorder record]) {
				NSLog(@"AVAudioRecorder record failed.");
			}
			break;
			
		case 1:	//Stop
			[recorder stop];
			[player stop];
			break;
			
		case 2:	//Play
			if (player == nil) {
				//Create the audio player.
				
				NSError *error = nil;
				player = [[AVAudioPlayer alloc] initWithContentsOfURL: url error: &error];
				if (player == nil) {
					NSLog(@"AVAudioPayer initWithContentsOfURL:error: %@", error);
					[error release];
					break;
				}
				
				player.delegate = self;
				player.volume = 1.0;		//the default
				player.numberOfLoops = 0;	//negative for infinite loop
			}
			
			if (![player prepareToPlay]) {
				NSLog(@"AVAudioPlayer prepareToPlay failed.");
			}
			
			if (![player play]) {
				NSLog(@"AVAudioPlayer play failed.");
			}
			break;
			
		default:
			NSLog(@"UISegmentedControl selectedSegmentIndex: returned %d",
				  [control selectedSegmentIndex]);
			break;
	}
}

#pragma mark -
#pragma mark Delegate of AVAudioRecorder

//Gets called automatically by the device
- (void) audioRecorderDidFinishRecording: (AVAudioRecorder *) r
							successfully: (BOOL) flag {
	
	if (r == recorder) {
		NSLog(@"audioRecorderDidFinishRecording:successfully: %d", flag);
		[view.control setEnabled: YES forSegmentAtIndex: 2];
	}
}

//Gets called automatically by the device
- (void) audioRecorderEncodeErrorDidOccur: (AVAudioRecorder *) r
									error: (NSError *) error {
	
	if (r == recorder) {
		NSLog(@"audioRecorderEncodeErrorDidOccur:error: %@", error);
	}
}

#pragma mark -
#pragma mark Delegate of AVAudioPlayer

- (void) audioPlayerDidFinishPlaying: (AVAudioPlayer *) p
						successfully: (BOOL) flag {
	
	if (p == player) {
		NSLog(@"audioPlayerDidFinishPlaying:successfully: %d", flag);
		
		//Unpress the Play button.
		view.control.selectedSegmentIndex = -1;
	}
}

- (void) audioPlayerDecodeErrorDidOccur: (AVAudioPlayer *) p
								  error: (NSError *) error {
	
	if (p == player) {
		NSLog(@"audioPlayerDecodeErrorDidOccur:error: %@", error);
	}
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
	[window release];
	[view release];
	[recorder release];	
    [super dealloc];
}


@end
