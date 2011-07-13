//
//  View.h
//  Pinch
//
//  Created by Michael Fenimore on 7/10/11.
//  Copyright 2011 --MichaelFenimore--. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface View : UIView {
	//Location of Touches
	CGPoint current0;
	CGPoint current1;
	
	CGPoint previous0;
	CGPoint previous1;
	
	UILabel *txtLabel;
}

@end
