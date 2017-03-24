//
//  PresentViewController.m
//  CustomTransion
//
//  Created by 吴珂 on 2017/3/23.
//  Copyright © 2017年 吴珂. All rights reserved.
//

#import "PresentViewController.h"
#import "ModalViewController.h"
#import "NormalPresentAnimation.h"
#import "NormalDismissAnimation.h"
#import "InteractiveDismissTransition.h"

@interface PresentViewController ()<UIViewControllerTransitioningDelegate>

//animations
@property (nonatomic, strong) NormalPresentAnimation *normalPresentAnimation;
@property (nonatomic, strong) NormalDismissAnimation *normalDismissAnimation;
@property (nonatomic, strong) InteractiveDismissTransition *dismissTransition;

//Actions
- (IBAction)presentAction:(UIButton *)sender;

@end

@implementation PresentViewController


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.normalPresentAnimation = [NormalPresentAnimation new];
        self.normalDismissAnimation = [NormalDismissAnimation new];
        self.dismissTransition = [InteractiveDismissTransition new];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (IBAction)presentAction:(UIButton *)sender {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ModalViewController *modalVC  = [sb instantiateViewControllerWithIdentifier:@"ModalViewController"];
    modalVC.modalPresentationStyle = UIModalPresentationCustom;
    modalVC.transitioningDelegate = self;
    
    __weak typeof(self)weakSelf = self;
    
    modalVC.dismissBlock = ^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf dismissViewControllerAnimated:YES completion:nil];
    };
    
    [self.dismissTransition writeToViewController:modalVC];
    
    [self presentViewController:modalVC animated:YES completion:nil];
}

#pragma mark - UIViewControllerTransitioningDelegate

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self.normalPresentAnimation;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self.normalDismissAnimation;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator
{
    return self.dismissTransition.isInteractive ? self.dismissTransition : nil;
}
@end
