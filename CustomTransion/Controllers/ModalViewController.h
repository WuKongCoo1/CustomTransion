//
//  ModalViewController.h
//  CustomTransion
//
//  Created by 吴珂 on 2017/3/23.
//  Copyright © 2017年 吴珂. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModalViewController : UIViewController

@property (nonatomic, copy) void (^dismissBlock)(void);

@end
