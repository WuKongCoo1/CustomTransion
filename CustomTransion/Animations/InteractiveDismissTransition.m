//
//  InteractiveDismissTransition.m
//  CustomTransion
//
//  Created by 吴珂 on 2017/3/23.
//  Copyright © 2017年 吴珂. All rights reserved.
//

#import "InteractiveDismissTransition.h"

@interface InteractiveDismissTransition ()

@property (nonatomic, assign) BOOL shouldComplete;
@property (nonatomic, weak) UIViewController *presentingVC;

@end

@implementation InteractiveDismissTransition

- (void)writeToViewController:(UIViewController *)vc
{
    self.presentingVC = vc;
    UIPanGestureRecognizer *ges = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    
    [vc.view addGestureRecognizer:ges];
}

- (void)handleGesture:(UIPanGestureRecognizer *)gesture
{
    CGPoint translation = [gesture translationInView:gesture.view.superview];
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
            self.interactive = YES;
            [self.presentingVC dismissViewControllerAnimated:YES completion:nil];
            break;
        case UIGestureRecognizerStateChanged:{
            CGFloat fraction = translation.y / [UIScreen mainScreen].bounds.size.height;
            fraction = fminf(fmaxf(fraction, 0.f), 1.f);
            self.shouldComplete = fraction > 0.5;
            [super updateInteractiveTransition:fraction];
            break;
        }
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:{
            
            self.interactive = NO;
            if (!self.shouldComplete || gesture.state == UIGestureRecognizerStateCancelled) {
                [self cancelInteractiveTransition];
            }else{
                [self finishInteractiveTransition];
            }
            
            break;
        }
            
        default:
            break;
    }

}

@end
