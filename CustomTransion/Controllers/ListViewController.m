//
//  ListViewController.m
//  CustomTransion
//
//  Created by 吴珂 on 2017/3/23.
//  Copyright © 2017年 吴珂. All rights reserved.
//

#import "ListViewController.h"

@interface ListViewController ()

@property (nonatomic, copy) NSArray *controllers;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.controllers = @[@"PresentViewController", @"NormalViewController"];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return self.controllers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    [self configureCell:cell forRowAtIndexPath:indexPath];
    
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.textLabel.text = self.controllers[indexPath.row];
}

#pragma mark - UITableViewDataSource
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *nextVC  = [sb instantiateViewControllerWithIdentifier:self.controllers[indexPath.row]];
    [self.navigationController pushViewController:nextVC animated:YES];
}

@end
