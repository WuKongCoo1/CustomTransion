//
//  ModalViewController.m
//  CustomTransion
//
//  Created by 吴珂 on 2017/3/23.
//  Copyright © 2017年 吴珂. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()

//actions
- (IBAction)dissmissAction:(id)sender;

@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (IBAction)dissmissAction:(id)sender {
    if (self.dismissBlock) {
        self.dismissBlock();
    }
}
@end
