//
//  PushViewController.m
//  CustomTransion
//
//  Created by 吴珂 on 2017/3/24.
//  Copyright © 2017年 吴珂. All rights reserved.
//

#import "PushViewController.h"


@interface PushViewController ()


- (IBAction)popAction:(id)sender;

@end

@implementation PushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)popAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dealloc
{
    NSLog(@"%s", __FUNCTION__);
}
@end
