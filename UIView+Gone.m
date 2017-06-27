//
//  UIView+Gone.m
//  Test
//
//  Created by LJW on 2017/6/27.
//  Copyright © 2017年 liangjiawei. All rights reserved.
//

#import "UIView+Gone.h"

@implementation UIView (Gone)

@dynamic gone;

- (void)setGone:(BOOL)gone {
    self.hidden = gone;
    if (gone) {
        NSLayoutConstraint *constraintWidth = [NSLayoutConstraint constraintWithItem:self
                                                                           attribute:NSLayoutAttributeWidth
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:nil
                                                                           attribute:NSLayoutAttributeNotAnAttribute
                                                                          multiplier:1.0
                                                                            constant:0];
        NSLayoutConstraint *constraintHeight = [NSLayoutConstraint constraintWithItem:self
                                                                            attribute:NSLayoutAttributeHeight
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:nil
                                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                                           multiplier:1.0
                                                                             constant:0];
        constraintWidth.identifier = @"GONE";
        constraintHeight.identifier = @"GONE";
        [self addConstraint:constraintWidth];
        [self addConstraint:constraintHeight];
    } else {
        for (NSLayoutConstraint *eachConstraint in self.constraints) {
            if ([eachConstraint.identifier isEqualToString:@"GONE"]) {
                [self removeConstraint:eachConstraint];
            }
        }
    }
}

@end
