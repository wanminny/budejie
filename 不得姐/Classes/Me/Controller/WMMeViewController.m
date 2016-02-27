//
//  WMMeViewController.m
//  不得姐
//
//  Created by wan on 16/2/21.
//  Copyright © 2016年 wan. All rights reserved.
//

#import "WMMeViewController.h"

@interface WMMeViewController ()

@end

@implementation WMMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"我";
    
    self.view.backgroundColor = WMVIEWBACKGROND(215, 215, 215);
    
    UIButton *setttingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [setttingBtn setImage:[UIImage imageNamed:@"mine-setting-icon"] forState:UIControlStateNormal];
    [setttingBtn setImage:[UIImage imageNamed:@"mine-setting-icon-click"] forState:UIControlStateHighlighted];
    [setttingBtn sizeToFit];
    UIBarButtonItem *settingItem = [[UIBarButtonItem alloc] initWithCustomView:setttingBtn];
    [setttingBtn addTarget:self action:@selector(settingClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *moonBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [moonBtn setImage:[UIImage imageNamed:@"mine-moon-icon"] forState:UIControlStateNormal];
    [moonBtn setImage:[UIImage imageNamed:@"mine-moon-icon-click"] forState:UIControlStateHighlighted];
    [moonBtn sizeToFit];
    UIBarButtonItem *moonItem = [[UIBarButtonItem alloc] initWithCustomView:moonBtn];
    [moonBtn addTarget:self action:@selector(moonClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.navigationItem.rightBarButtonItems = @[settingItem,moonItem];
}

-(void)moonClick
{
    WMLFunc;
}

-(void)settingClick
{
    WMLFunc;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
