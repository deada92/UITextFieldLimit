//
//  UITextFieldLimit.m
//  UITextFieldLimit
//
//  NO LICENCE! WOHOOO! It's developed by Jonathan Gurebo! and it means that you can do whatever you like to do.
//  Sell it, modify it, distribute it, copy it, resell it, patent it. Do what-ever you like. But you can give me credit if you like to ;) OPTIONAL
//
//  Created by Jonathan Gurebo on 2014-04-12.
//  Copyright (c) 2014 Jonathan Gurebo. All rights reserved.
//

#import "UITextFieldLimit.h"

@implementation UITextFieldLimit

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        limit=10;// -- Default limit
        self.limitDelegate = [[UITextFieldLimitDelegate alloc]init];
        self.delegate = self.limitDelegate;
        [self.limitDelegate initializeLimitLabel];
    }
    return self;
}

/*
-(id)initWithCoder:(NSCoder *)inCoder {
    if (self = [super initWithCoder:inCoder]) {
        limit=10;// -- Default limit
        self.limitDelegate = [[UITextFieldLimitDelegate alloc]init];
        self.delegate = self.limitDelegate;
        [self.limitDelegate initializeLimitLabel];
    }
    return self;
}
*/

-(id)init {
    limit=10;// -- Default limit
    self.limitDelegate = [[UITextFieldLimitDelegate alloc]init];
    self.delegate = self.limitDelegate;
    [self.limitDelegate initializeLimitLabel];
    return self;
}

-(long)limit {
    return [self.limitDelegate limit];
}

-(void)initializeLimitLabel {
    [self.limitDelegate initializeLimitLabelWithFont:[UIFont fontWithName:@"AppleSDGothicNeo-Light" size:14.0] andTextColor:[UIColor blackColor]];// <-- Customize the label font and color. BUT! By customizing the size and, you will have to change the bounds
}

-(void)setLimit:(long)theLimit {
    [self.limitDelegate setLimit:theLimit];
    [self.limitDelegate textField:self shouldChangeCharactersInRange:NSMakeRange(0, 0) replacementString:@""];
}

-(void)initializeLimitLabelWithFont:(UIFont *)font andTextColor:(UIColor *)textColor {
    [self.limitDelegate initializeLimitLabelWithFont:font andTextColor:textColor];
}



@end
