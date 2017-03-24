//
//  NormalDismissAnimation.m
//  CustomTransion
//
//  Created by 吴珂 on 2017/3/23.
//  Copyright © 2017年 吴珂. All rights reserved.
//

#import "NormalDismissAnimation.h"

@implementation NormalDismissAnimation

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *container = [transitionContext containerView];
    
    //step1
    [container addSubview:toView];
    [container sendSubviewToBack:toView];
    
    CGRect finalFrame = CGRectOffset(fromView.bounds, 0, CGRectGetHeight(fromView.bounds));
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                     animations:^{
                         fromView.frame = finalFrame;
    }
                    completion:^(BOOL finished) {
                        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end
