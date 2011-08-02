//
//  InfoView.h
//  LTrain
//
//  Created by scholar on 7/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoView: UIView {
	NSString *information;
}

- (id) initWithFrame: (CGRect) frame information: (NSString *) i;

@property (nonatomic, copy) IBOutlet NSString *information;
@end
