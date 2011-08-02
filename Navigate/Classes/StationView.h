//
//  StationView.h
//  Navigate
//
//  Created by Ann McDermott on 7/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StationController;

@interface StationView: UIView {
	StationController *controller;
}

- (id) initWithFrame: (CGRect) frame controller: (StationController *) c;
@end
