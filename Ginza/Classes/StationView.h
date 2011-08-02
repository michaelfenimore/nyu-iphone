//
//  StationView.h
//  Ginza
//
//  Created by Michael Fenimore on 8/1/11.
//  Copyright 2011 --MichaelFenimore--. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StationController;

@interface StationView: UIView {
	StationController *controller;
}

- (id) initWithFrame: (CGRect) frame controller: (StationController *) c;
@end