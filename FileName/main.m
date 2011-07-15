//
//  main.m
//  FileName
//
//  Created by Computer Lab 1040 on 07/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

int main(int argc, char *argv[]) {
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
	NSString *home = NSHomeDirectory();
	NSLog(@"home directory == \"%@\"\n", home);
	
	NSFileManager *manager = [NSFileManager defaultManager];
	NSDirectoryEnumerator *e = [manager enumeratorAtPath: home];
	NSString *name = nil;
	
	while ((name = [e nextObject]) != nil) {
		NSLog(@"%@", name);
		//File Path Concatination (Not just a string concatination)
		NSString *fullPathname = [home stringByAppendingPathComponent: name];
		NSLog(@"%@", fullPathname);
		
		NSError *error = nil;
		NSDictionary *attributes =
		[manager attributesOfItemAtPath: fullPathname error: &error];
		
		if (error != nil) {
			NSLog(@"%@", error);
			[error release];
			continue;	//go on to the next file
		}
		
		NSEnumerator *e = [attributes keyEnumerator];
		NSString *key = nil;
		
//		while ((key = [e nextObject]) != nil) {
//			NSLog(@"%@ %@", key, [attributes objectForKey: key]);
//		}
		//Done to show file permission in Octal format, not decimal. 
		while ((key = [e nextObject]) != nil) {
			//id is used when you don't know if it is a String, Number, etc.
			id attribute = [attributes objectForKey: key];
			
			if ([key isEqualToString: @"NSFilePosixPermissions"]) {
				unsigned long permissions = [attribute unsignedLongValue];
				NSLog(@"%@ %lo", key, permissions);
			} else {
				NSLog(@"%@ %@", key, attribute);
			}
		}
		
		NSLog(@"----------------------------------------");
	}
	
	int retVal = UIApplicationMain(argc, argv, nil, nil);
	[pool release];
	return retVal;
}