//
//  BouncePushAnimation.m
//  CustomTransion
//
//  Created by 吴珂 on 2017/3/24.
//  Copyright © 2017年 吴珂. All rights reserved.
//

#import "BouncePushAnimation.h"

@implementation BouncePushAnimation
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *container = [transitionContext containerView];
    
    
    [container addSubview:toView];
    
    CGRect beginFrame = CGRectInset(toView.frame, CGRectGetWidth(toView.frame) / 2, CGRectGetHeight(toView.frame) / 2);
    CGRect finalFrame = toView.frame;
    toView.frame = beginFrame;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0.1
         usingSpringWithDamping:0.3
          initialSpringVelocity:0.5
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         toView.frame = finalFrame;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                     }];
}

@end
