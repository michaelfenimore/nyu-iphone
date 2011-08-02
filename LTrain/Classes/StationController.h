//
//  StationController.h
//  LTrain
//
//  Created by scholar on 7/14/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StationController: UIViewController {
}

- (id) initWithTitle: (NSString *) title easternNeighbor: (BOOL) b;
- (void) nextStation;
- (void) moreInfo;
@end
