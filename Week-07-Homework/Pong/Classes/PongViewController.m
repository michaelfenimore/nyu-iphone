//
//  PongViewController.m
//  Pong
//
//  Created by Michael Fenimore on 7/24/11.
//  Copyright 2011 -MichaelFenimore--. All rights reserved.
//

#import "PongViewController.h"
#import "View.h"

@implementation PongViewController



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	CGRect f = [UIScreen mainScreen].applicationFrame;
	self.view = [[View alloc] initWithFrame: f];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	displayLink = [CADisplayLink displayLinkWithTarget:self.view selector:@selector(move:)];
	
	//Call move: every time the display refreshes.
	[displayLink setFrameInterval:1];
	
	NSRunLoop *loop = [NSRunLoop currentRunLoop];
	[displayLink addToRunLoop:loop forMode:NSDefaultRunLoopMode];
}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	NSRunLoop *loop = [NSRunLoop currentRunLoop];
	[displayLink removeFromRunLoop:loop forMode:NSDefaultRunLoopMode];
	[self.view release];
    [super dealloc];
}

@end
