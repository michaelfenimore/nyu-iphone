//
//  View.m
//  Pong
//
//  Created by Michael Fenimore on 7/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "View.h"
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>


@implementation View


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
		self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"horizon.png"]];
		
		//Create the paddle.
		frame = CGRectMake(100, 215, 80, 15);
		paddle = [[UIView alloc] initWithFrame: frame];
		paddle.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"paddle.png"]];
		[self addSubview: paddle];
		
		//Create the ball in the upper left corner of this View.
		frame = CGRectMake(0, 0, 39, 39);
		invader = [[UIView alloc] initWithFrame: frame];
		invader.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"invader01.png"]];
		
		// Get the file path for the sound effects
		NSString *filePath = [[NSBundle mainBundle] pathForResource:@"pong" ofType:@"mp3"];
		
		//Convert the filepath to a URL
		NSURL *fileURL = [NSURL fileURLWithPath:filePath isDirectory:NO];
		
		//Initialize the AVAudioPlayer
		NSError *error = nil;
		audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:&error];
		if (audioPlayer == nil) {
			NSLog(@"Could not initialize player:  %@", error);
			[error release];
		}
		
		// Preloads the buffer and prepares the audio for playing.
		[audioPlayer prepareToPlay];
		
		//Make the image background transparent
		[invader setOpaque:NO];
		[self addSubview: invader];
		
		//Ball initially moves to lower right.
		//Values of 2 will slow its speed
		dx = 4;
		dy = 4;
    }
    return self;
}

//Change the ball's direction of motion,
//if necessary to avoid an impending collision.

- (void) bounce {	
	//Where the ball would be if its horizontal motion were allowed
	//to continue for one more move.
	CGRect horizontal = invader.frame;
	horizontal.origin.x += dx;
	
	//Where the ball would be if its vertical motion were allowed
	//to continue for one more move.
	CGRect vertical = invader.frame;
	vertical.origin.y += dy;
	
	//Ball must remain inside self.bounds.
	if (!CGRectEqualToRect(horizontal, CGRectIntersection(horizontal, self.bounds))) {
		//Ball will bounce off left or right edge of View.
		dx = -dx;
	}
	
	if (!CGRectEqualToRect(vertical, CGRectIntersection(vertical, self.bounds))) {
		//Ball will bounce off top or bottom edge of View.
		dy = -dy;
	}
	
	//If the ball is not currently intersecting the paddle,
	if (!CGRectIntersectsRect(invader.frame, paddle.frame)) {
		
		//but if the ball will intersect the paddle on the next move,
		if (CGRectIntersectsRect(horizontal, paddle.frame)) {
			dx = -dx;
			audioPlayer.volume = 1.0;
			audioPlayer.numberOfLoops = 0;
			[audioPlayer play];
		}
		
		if (CGRectIntersectsRect(vertical, paddle.frame)) {
			dy = -dy;
			audioPlayer.volume = 1.0;
			audioPlayer.numberOfLoops = 0;
			[audioPlayer play];
		}
	}
}

- (void) touchesMoved: (NSSet *) touches withEvent: (UIEvent *) event {
	UITouch *myFingerTouch = [touches anyObject];
	CGPoint pointOfTouch = [myFingerTouch locationInView: self];
	CGFloat y = pointOfTouch.x;
	
	//Don't let the paddle move off the left or right of the View.
	CGFloat halfPaddle = paddle.bounds.size.width / 2;
	y = MIN(y, self.bounds.size.width - halfPaddle);	//don't let y get too big
	y = MAX(y, halfPaddle);								//don't let y get too small
	paddle.center = CGPointMake(y, paddle.center.y);
	[self bounce];}

- (void) move: (CADisplayLink *) displayLink {
	//NSLog(@"%.15g", displayLink.timestamp);	//15 significant digits
	
	invader.center = CGPointMake(invader.center.x + dx, invader.center.y + dy);
	[self bounce];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/

- (void)dealloc {
	[audioPlayer release];
    [super dealloc];
}


@end
