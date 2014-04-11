//
//  JBAnimatedTabTransition.m
//  Transitions
//
//  Created by Joachim Bondo on 10/04/2014.
//  Copyright (c) 2014 Joachim Bondo. All rights reserved.
//

#import "JBAnimatedTabTransition.h"

@implementation JBAnimatedTabTransition

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return 1.2;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    static CGFloat const kDamping = 0.75;
    static CGFloat const kInitialSpringVelocity = 0.5;
    
    UIView *containerView = [transitionContext containerView];
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *fromView = fromViewController.view;
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = toViewController.view;
    
    CGRect onscreenViewFrame = fromView.frame;
    CGRect offscreenFrame = CGRectApplyAffineTransform (onscreenViewFrame, CGAffineTransformMakeTranslation (0, onscreenViewFrame.size.height));
    
    toView.frame = offscreenFrame;
    [containerView addSubview:toView]; // Per the contract, this is our responsibility
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:kDamping initialSpringVelocity:kInitialSpringVelocity options:0x00 animations:^{
        fromView.frame = offscreenFrame;
        toView.frame = onscreenViewFrame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES]; // We must call this to have things cleaned up (restoring to a consistent view controller hierarchy)
    }];
}

@end
