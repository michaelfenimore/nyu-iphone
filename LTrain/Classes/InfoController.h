//
//  InfoController.h
//  LTrain
//
//  Created by scholar on 7/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface InfoController: UIViewController {
	NSString *information;
}

- (id) initWithTitle: (NSString *) title information: (NSString *) i;

@property (nonatomic, copy) IBOutlet NSString *information;
@end
