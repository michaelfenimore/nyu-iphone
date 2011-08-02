//
//  ModalView.h
//  Modal
//
//  Created by scholar on 3/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ModalViewController;

@interface ModalView: UIView {
	ModalViewController *controller;
}

- (id) initWithFrame: (CGRect) frame controller: (ModalViewController *) c;
@end
