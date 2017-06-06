//
//  ViewController.h
//  nib
//
//  Created by Computer Lab 1040 on 08/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController {
	UIButton *button;
}

@property (nonatomic, retain) IBOutlet UIButton *button;

- (IBAction) touchUpInside: (id) sender;

@end
