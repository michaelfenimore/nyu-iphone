//
//  StationView.h
//  LTrain
//
//  Created by scholar on 7/14/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StationController;

@interface StationView: UIView {
	StationController *controller;
	UIButton *button;
}

- (id) initWithFrame: (CGRect) frame controller: (StationController *) c;
@end
