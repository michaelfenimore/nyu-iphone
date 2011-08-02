//
//  ViewController.h
//  TabBar
//
//  Created by NYU User on 12/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController: UIViewController {
	NSString *text;
}

- (id) initWithText: (NSString *) t
	title: (NSString *) title
	image: (UIImage *) image
	badge: (NSString *) badge;

@property (nonatomic, copy) IBOutlet NSString *text;
@end
