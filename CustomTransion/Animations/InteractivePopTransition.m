//
//  InteractivePopTransition.m
//  CustomTransion
//
//  Created by 吴珂 on 2017/3/24.
//  Copyright © 2017年 吴珂. All rights reserved.
//

#import "InteractivePopTransition.h"

@interface InteractivePopTransition ()

@property (nonatomic, assign) BOOL shouldComplete;
@property (nonatomic, weak) UIViewController *pushedViewController;

@end

@implementation InteractivePopTransition

- (void)writeToViewController:(UIViewController *)vc
{
    //全屏侧滑
//    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
//    [vc.view addGestureRecognizer:gesture];
//    self.pushedViewController = vc;
    
    //仿原生
    UIScreenEdgePanGestureRecognizer *edgeGR = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    edgeGR.edges = UIRectEdgeLeft;
    [vc.view addGestureRecognizer:edgeGR];
    self.pushedViewController = vc;
}

- (void)handleGesture:(UIPanGestureRecognizer *)gesture
{
    CGPoint translation = [gesture translationInView:gesture.view.superview];
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
            self.interactive = YES;
            [self.pushedViewController.navigationController popViewControllerAnimated:YES];
            break;
        case UIGestureRecognizerStateChanged:{
            CGFloat fraction = translation.x / [UIScreen mainScreen].bounds.size.width;
            fraction = fminf(fmaxf(fraction, 0.f), 1.f);
            self.shouldComplete = fraction > 0.5;
            [super updateInteractiveTransition:fraction];
            break;
        }
            
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded:{
            self.interactive = NO;
            if (self.shouldComplete && gesture.state == UIGestureRecognizerStateEnded) {
                [super finishInteractiveTransition];
            }else{
                [super cancelInteractiveTransition];
            }
        }
        default:
            NSLog(@"state:%li", (long)gesture.state);
            break;
    }
}

@end
