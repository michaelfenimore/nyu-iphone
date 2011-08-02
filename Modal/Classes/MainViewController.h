//
//  MainController.h
//  Modal
//
//  Created by scholar on 3/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ModalViewController;

@interface MainViewController: UIViewController {
	ModalViewController *modalViewController;
}

- (void) presentModalViewController;
- (void) dismissModalViewController;
@end
