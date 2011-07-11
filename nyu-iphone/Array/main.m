//
//  main.m
//  Array
//
//  Created by Fenimore, Michael on 7/6/11.
//  Copyright 2011 --MichaelFenimore--. All rights reserved.
//

#import <UIKit/UIKit.h>

int main(int argc, char *argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
	/*
	NSMutableArray *boroughs = [[NSMutableArray alloc] init]; //Starts Empty
		[boroughs addObject:@"Bronx"];
		[boroughs addObject:@"Brooklyn"];
		[boroughs addObject:@"Manhattan"];
		[boroughs addObject:@"Queens"];
		[boroughs addObject:@"Staten Island"];
		[boroughs addObject:[NSNumber numberWithFloat:3.14];
		[boroughs addObject:[NSValue valueWithCGPoint:CGPointMake(10, 20)];
	*/
	
	
	NSArray *boroughs = [NSArray arrayWithObjects:
						 @"Bronx",
						 @"Brooklyn",
						 @"Manhattan",
						 @"Queens",
						 @"Staten Island",
						 @"12",
						 [NSNumber numberWithFloat:3.14],
						 [NSValue valueWithCGPoint:CGPointMake(10, 20)],
						 nil
						 ];
	
	NSUInteger counter = boroughs.count;
	NSLog(@"Borogh Count: %u", counter);
	
	for (NSString *Borough in boroughs) {
		NSLog(@"%@", Borough);
	}
	
	if (counter > 0) {
		NSLog(@"The first borough is %@.", [boroughs objectAtIndex: 0]);
		NSLog(@"The last borough is %@.", [boroughs lastObject]);
	}
	
	//Lists all the font available
	/*
	SEL orderAlphabetically = @selector(caseInsensitiveCompare:);
	NSArray *sorted = [[UIFont familyNames] sortedArrayUsingSelector:orderAlphabetically];
	
	for (NSString *fontName in sorted) {
		NSLog(@"%@", fontName);
	}
	
	//Unsorted
	for (NSString *name in [UIFont familyNames]) {
		NSLog(@"%@", name);
	}
	*/
	
	//[boroughs release];
    int retVal = UIApplicationMain(argc, argv, nil, @"ArrayAppDelegate");
    [pool release];
    return retVal;
}