//
//  View.m
//  TextField
//
//  Created by Computer Lab 1040 on 07/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "View.h"

@implementation View


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		self.backgroundColor = [UIColor whiteColor];
		
		//Size of the UITextField.
		UIFont *font = [UIFont systemFontOfSize: 17];
		CGFloat h = 2 + font.ascender - font.descender;
		CGSize size = CGSizeMake(200, h);
		
		//Center the UITextField in the TextFieldView.
		CGRect b = self.bounds;
		
		CGRect f = CGRectMake(
							  b.origin.x + (b.size.width - size.width) / 2,
							  b.origin.y + (b.size.height - size.height) / 2,
							  size.width,
							  size.height
							  );
		
		field = [[UITextField alloc] initWithFrame: f];
		field.borderStyle = UITextBorderStyleNone;	//default
		
		field.backgroundColor = [UIColor grayColor];
		field.textColor = [UIColor blackColor];
		
		field.clearButtonMode = UITextFieldViewModeAlways;
		field.keyboardType = UIKeyboardTypeDefault;
		field.returnKeyType = UIReturnKeyDone;
		
		field.font = font;
		field.placeholder = @"<type a word>";
		field.textAlignment = UITextAlignmentLeft;	//default
		field.autocapitalizationType = UITextAutocapitalizationTypeNone; //default
		field.autocorrectionType = UITextAutocorrectionTypeNo;
		field.secureTextEntry = NO;	//for secret passwords
		
		field.delegate = self;
		[self addSubview: field];		
    }
    return self;
}

#pragma mark -
#pragma mark methods of UITextFieldDelegate protocol

//Called when return key is pressed.
//Decide if the app should accept this input and hide the keyboard.

- (BOOL) textFieldShouldReturn: (UITextField *) textField {
	NSLog(@"textFieldShouldReturn:");
	if (textField == field) {
		[field resignFirstResponder];	//Hide keyboard.
		return YES;	//The text field should do its default behavior.
	}
	
	return NO;	//The text field should not do its default behavior.
}

//Called when keyboard is hidden.
//Process the text that was input.

- (void) textFieldDidEndEditing: (UITextField *) textField {
	NSLog(@"textFieldDidEndEditing:");
	if (textField == field) {
		[self setNeedsDisplay];
	}
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
	NSString *pigLatin = nil;
	
	if (field.text == nil || [field.text isEqualToString: @""]) {
		pigLatin = @"";
	} else {
		NSString *lowercase = [field.text lowercaseString];
		pigLatin = [NSString stringWithFormat: @"%@%@ay",
					[lowercase substringFromIndex: 1],	//all characters except the first
					[lowercase substringToIndex: 1]		//the first character
					];
	}
	
	//Draw the string two pixels above the UITextField.
	UIFont *f = [UIFont systemFontOfSize: 17];
	CGSize s = [pigLatin sizeWithFont: f];
	
	CGPoint p = CGPointMake(
							self.bounds.origin.x + (self.bounds.size.width - s.width) / 2,
							field.frame.origin.y - s.height - 2
							);
	
	[pigLatin drawAtPoint: p withFont: f];	
}

- (void)dealloc {
	[field release];
    [super dealloc];
}


@end
