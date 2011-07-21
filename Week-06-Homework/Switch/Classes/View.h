//
//  View.h
//  Switch
//
//  Created by Michael Fenimore on 7/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface View : UIView {
	UISwitch *mySwitch01;
	UISwitch *mySwitch02;
	UISwitch *mySwitch03;
	UISwitch *mySwitch04;
	UISwitch *mySwitch05;
}

@property (nonatomic, retain) IBOutlet UISwitch *mySwitch01;
@property (nonatomic, retain) IBOutlet UISwitch *mySwitch02;
@property (nonatomic, retain) IBOutlet UISwitch *mySwitch03;
@property (nonatomic, retain) IBOutlet UISwitch *mySwitch04;
@property (nonatomic, retain) IBOutlet UISwitch *mySwitch05;

@end
