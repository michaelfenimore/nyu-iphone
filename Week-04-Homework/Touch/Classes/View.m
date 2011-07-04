//
//  View.m
//  Touch
//
//  Created by Fenimore, Michael on 7/1/11.
//  Copyright 2011 --MichaelFenimore--. All rights reserved.
//

#import "View.h"

@implementation View


- (id) initWithFrame: (CGRect) frame {
	if ((self = [super initWithFrame: frame]) != nil) {
		self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"nightsky.png"]];
		
		CGRect theBounds = self.bounds;
		CGFloat shapeWidth = 90;
		CGFloat shapeHeight = 90;
		//NSLog(@"The Bounds: %g, %g", theBounds.origin.x, theBounds.origin.y);
		//NSLog(@"The Dimensions: %g, %g", theBounds.size.width, theBounds.size.height);		
		

		CGRect myCenterPoint = CGRectMake(theBounds.size.width/2 - shapeWidth/2,
								  theBounds.size.height/2 - shapeHeight/2,
								  shapeWidth,
								  shapeHeight);

		myView = [[UIView alloc] initWithFrame: myCenterPoint];
		
		myView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"enterprise.png"]];
		
		[myView setOpaque:NO];
		[self addSubview: myView];
		
		//Get Audio file location and prepare to play on screen touch.
		NSBundle *bundle = [NSBundle mainBundle];
		if (bundle == nil) {
			NSLog(@"Not Able to get Bundle Path: \"%@\"", bundle);
		}
		
		NSString *audioPath = [bundle pathForResource:@"engage" ofType:@"mp3"];
		if (audioPath == nil) {
			NSLog(@"Not Able to get Audio Path: \"%@\"", audioPath);
		}
		
		NSURL *audioURL = [NSURL fileURLWithPath:audioPath isDirectory: NO];
		if (audioURL == nil) {
			NSLog(@"Audio URL: \"%@\"", audioURL);
		}
		
		NSError *error = nil;
		player = [[AVAudioPlayer alloc] initWithContentsOfURL:audioURL error: &error];
		if (player == nil) {
			NSLog(@"Player Error: %@", error);
			[error release];
			[self release];
		}
		//Prepares the audio player for playback by preloading its buffers
		[player prepareToPlay];
	}
	return self;
}

- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
	if (touches.count > 0) {
		/*
		 The atan2() function takes two values, x and y, then calculates
		 the angle relative to the x axis. atan2 also takes into account
		 the sign of both x and y so it can correctly determine any angle
		 along the circle.
		*/
		
		player.volume = 1.0;
		player.numberOfLoops = 0;
		[player play];
		
		//Used to get the rotation of the Enterprise
		CGFloat oldY = myView.center.y;
		CGFloat oldX = myView.center.x;
		
		[UIView animateWithDuration: 3.0
							  delay: 0.0
							options: UIViewAnimationOptionCurveEaseInOut
									| UIViewAnimationOptionAllowUserInteraction
									| UIViewAnimationOptionBeginFromCurrentState
						 animations: ^{
							 myView.center = [[touches anyObject] locationInView: self];
							 CGFloat turnRadians = atan2(myView.center.y - oldY, myView.center.x - oldX);
							 myView.transform = CGAffineTransformMakeRotation(turnRadians);
							 //NSLog(@"Y:%g  and X:%g", (myView.center.y - oldY), (myView.center.x - oldX));
							 //NSLog(@"TurnRadians: %g", turnRadians);
						 }
						 completion: NULL
		 ];
	}
}

- (void) touchesMoved: (NSSet *) touches withEvent: (UIEvent *) event {
	if (touches.count > 0) {
		myView.center = [[touches anyObject] locationInView: self];
	}
}

- (void) touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event {
	
}
 
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/

- (void)dealloc {
	[player release];
	[myView release];
    [super dealloc];
}


@end
