//
//  JBChildViewController.m
//  Transitions
//
//  Created by Joachim Bondo on 10/04/2014.
//  Copyright (c) 2014 Joachim Bondo. All rights reserved.
//

#import "JBChildViewController.h"

@interface JBChildViewController ()
@property (nonatomic, strong) UILabel *_titleLabel;
@end

@implementation JBChildViewController

- (void)setTitle:(NSString *)title {
    super.title = title;
    [self JB_updateAppearance];
}

- (void)setThemeColor:(UIColor *)themeColor {
    _themeColor = themeColor;
    [self JB_updateAppearance];
}

- (void)loadView {
    
    self._titleLabel = [[UILabel alloc] init];
    self._titleLabel.backgroundColor = [UIColor clearColor];
    self._titleLabel.font = [UIFont boldSystemFontOfSize:18];
    self._titleLabel.textAlignment = NSTextAlignmentCenter;
    [self._titleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.view = [[UIView alloc] init];
    [self.view addSubview:self._titleLabel];
    
    // Center label in view.
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self._titleLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.8f constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self._titleLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:36]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self._titleLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self._titleLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
}

- (void)viewDidLoad {
    self._titleLabel.text = self.title;
    [self JB_updateAppearance];
}

#pragma mark - Private Methods

- (void)JB_updateAppearance {
    if ([self isViewLoaded]) {
        self._titleLabel.text = self.title;
        self.view.backgroundColor = self.themeColor;
        self.view.tintColor = self.themeColor;
    }
}

@end
