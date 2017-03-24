//
//  NormalPopAnimation.m
//  CustomTransion
//
//  Created by 吴珂 on 2017/3/24.
//  Copyright © 2017年 吴珂. All rights reserved.
//

#import "NormalPopAnimation.h"

@implementation NormalPopAnimation
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *container = [transitionContext containerView];
    
    
    [container addSubview:toView];
    [container sendSubviewToBack:toView];
    
    CGRect finalFrame = CGRectOffset(fromView.bounds, CGRectGetWidth(fromView.bounds), 0);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                     animations:^{
                         fromView.frame = finalFrame;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                     }];
}
@end
