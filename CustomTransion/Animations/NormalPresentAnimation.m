//
//  NormalPresentAnimation.m
//  CustomTransion
//
//  Created by 吴珂 on 2017/3/23.
//  Copyright © 2017年 吴珂. All rights reserved.
//

#import "NormalPresentAnimation.h"

@implementation NormalPresentAnimation

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *container = [transitionContext containerView];
    
    //step1 加toView添加到容器
    [container addSubview:toView];
    
    //step2 动画
    CGRect beginFrame = CGRectOffset(toView.frame, 0, CGRectGetHeight(toView.frame));
    toView.frame = beginFrame;
    CGRect finalFrame = [transitionContext finalFrameForViewController:[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey]];
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                     animations:^{
                         toView.frame = finalFrame;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:finished];
    }];
}
@end
