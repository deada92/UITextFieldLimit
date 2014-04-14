//
//  UITextFieldLimitDelegate.h
//  TextFeldLimit
//
//  Created by Saif Al-Dilaimi on 14.04.14.
//  Copyright (c) 2014 Saif Al-Dilaimi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextFieldLimitDelegate : UITextField<UITextFieldDelegate>{
    long limit;
    UILabel *limitLabel;
}

-(void)setLimit:(long)theLimit;
-(void)initializeLimitLabel;
-(void)initializeLimitLabelWithFont:(UIFont *)font andTextColor:(UIColor *)textColor;

@property (readwrite, nonatomic) long limit;

@end
