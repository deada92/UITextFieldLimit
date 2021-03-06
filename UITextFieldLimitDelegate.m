//
//  UITextFieldLimitDelegate.m
//  TextFeldLimit
//
//  Created by Saif Al-Dilaimi on 14.04.14.
//  Copyright (c) 2014 Saif Al-Dilaimi. All rights reserved.
//

#import "UITextFieldLimitDelegate.h"

@implementation UITextFieldLimitDelegate


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        limit=10;// -- Default limit
        [self initializeLimitLabel];
    }
    return self;
}

/*
- (id)initWithCoder:(NSCoder *)inCoder {
    if (self = [super initWithCoder:inCoder]) {
        limit=10;// -- Default limit
        [self initializeLimitLabel];
    }
    return self;
}
*/

-(id)init {
    limit=10;// -- Default limit
    [self initializeLimitLabel];
    return self;
}

-(long)limit {
    return limit;
}

-(void)initializeLimitLabel {
    [self initializeLimitLabelWithFont:[UIFont fontWithName:@"AppleSDGothicNeo-Light" size:14.0] andTextColor:[UIColor blackColor]];// <-- Customize the label font and color. BUT! By customizing the size and, you will have to change the bounds
}

-(void)setLimit:(long)theLimit {
    limit=theLimit;
    [self textField:self shouldChangeCharactersInRange:NSMakeRange(0, 0) replacementString:@""];
}

-(void)initializeLimitLabelWithFont:(UIFont *)font andTextColor:(UIColor *)textColor {
    limitLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.bounds.size.width-([[NSNumber numberWithFloat:font.pointSize] doubleValue]*(2.285714)), 8, 30, self.bounds.size.height)];
    
    [limitLabel setTextColor:textColor];
    [limitLabel setFont:font];
    
    [limitLabel setBackgroundColor:[UIColor clearColor]];
    [limitLabel setTextAlignment:NSTextAlignmentLeft];
    [limitLabel setNumberOfLines:1];
    [limitLabel setText:@""];
    [self setRightView:limitLabel];
    [self setRightViewMode:UITextFieldViewModeWhileEditing];
    [self textField:self shouldChangeCharactersInRange:NSMakeRange(0, 0) replacementString:@""];
    
    limitLabel.hidden=YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    long MAXLENGTH=limit;
    NSString *newText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if(newText.length>MAXLENGTH) {
        [self shakeLabel];
        return NO;
    }
    [limitLabel setText:[NSString stringWithFormat:@"%lu",MAXLENGTH-newText.length]];
    
    return YES;
}

-(long)expectedLabelWidthWithText:(NSString *)text andFont:(UIFont *)font {
    CGRect labelRect = [text
                        boundingRectWithSize:CGSizeMake(200, 0)
                        options:NSStringDrawingUsesLineFragmentOrigin
                        attributes:@{
                                     NSFontAttributeName : limitLabel.font
                                     }
                        context:nil];
    return labelRect.size.width;
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    limitLabel.hidden=YES;
}
-(void)textFieldDidBeginEditing:(UITextField *)textField {
    if(limitLabel.isHidden) {
        limitLabel.hidden=NO;
    }
}

-(void)shakeLabel {
    
    CABasicAnimation *shake = [CABasicAnimation animationWithKeyPath:@"position"];
    [shake setDuration:0.1];
    [shake setRepeatCount:2];
    [shake setAutoreverses:YES];
    [shake setFromValue:[NSValue valueWithCGPoint:
                         CGPointMake(limitLabel.center.x - 5,limitLabel.center.y)]];
    [shake setToValue:[NSValue valueWithCGPoint:
                       CGPointMake(limitLabel.center.x + 5, limitLabel.center.y)]];
    [limitLabel.layer addAnimation:shake forKey:@"position"];
}


@end
