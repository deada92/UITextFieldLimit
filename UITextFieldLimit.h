//
//  UITextFieldLimit.h
//  UITextFieldLimit
//
//  NO LICENCE! WOHOOO! It's developed by Jonathan Gurebo! and it means that you can do whatever you like to do.
//  Sell it, modify it, distribute it, copy it, resell it, patent it. Do what-ever you like. But you can give me credit if you like to ;) OPTIONAL
//
//  Created by Jonathan Gurebo on 2014-04-12.
//  Copyright (c) 2014 Jonathan Gurebo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITextFieldLimitDelegate.h"

@interface UITextFieldLimit : UITextField<UITextFieldDelegate> {
    long limit;
    UILabel *limitLabel;
}

-(void)setLimit:(long)theLimit;
-(void)initializeLimitLabelWithFont:(UIFont *)font andTextColor:(UIColor *)textColor;

@property(strong, nonatomic) UITextFieldLimitDelegate *limitDelegate;

@end
