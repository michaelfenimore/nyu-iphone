//
//  View.h
//  Segmented
//
//  Created by Computer Lab 1040 on 07/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface View : UIView {
	UISegmentedControl *control;
}

@property (nonatomic, retain) IBOutlet UISegmentedControl *control;

@end