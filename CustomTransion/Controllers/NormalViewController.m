//
//  NormalViewController.m
//  CustomTransion
//
//  Created by 吴珂 on 2017/3/24.
//  Copyright © 2017年 吴珂. All rights reserved.
//

#import "NormalViewController.h"
#import "BouncePushAnimation.h"
#import "NormalPopAnimation.h"
#import "PushViewController.h"
#import "InteractivePopTransition.h"

@interface NormalViewController ()<UINavigationControllerDelegate>

@property (nonatomic, strong) BouncePushAnimation *pushAnimation;
@property (nonatomic, strong) NormalPopAnimation *popAnimation;
@property (nonatomic, strong) InteractivePopTransition *interactionTransion;

- (IBAction)pushAction:(id)sender;
@end

@implementation NormalViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.pushAnimation = [BouncePushAnimation new];
        self.popAnimation = [NormalPopAnimation new];
        self.interactionTransion = [InteractivePopTransition new];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - UINavigationControllerDelegate
- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController NS_AVAILABLE_IOS(7_0)
{
    return self.interactionTransion.isInteractive ? self.interactionTransion : nil;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC  NS_AVAILABLE_IOS(7_0)
{
    if(operation == UINavigationControllerOperationPop){
        return self.popAnimation;
    }else if (operation == UINavigationControllerOperationPush){
        return self.pushAnimation;
    }
    return self.pushAnimation;
}


- (IBAction)pushAction:(id)sender {
    [self performSegueWithIdentifier:@"pushViewController" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController *vc = segue.destinationViewController;
    [self.interactionTransion writeToViewController:vc];
    self.navigationController.delegate = self;
}
@end
