//
//  WMNewViewController.m
//  不得姐
//
//  Created by wan on 16/2/21.
//  Copyright © 2016年 wan. All rights reserved.
//

#import "WMNewViewController.h"

@interface WMNewViewController ()

@end

@implementation WMNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"新帖";
    
    self.view.backgroundColor = WMVIEWBACKGROND(215, 215, 215);
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"MainTagSubIcon"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"MainTagSubIconClick"] forState:UIControlStateHighlighted];
    
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [btn sizeToFit];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
}

-(void)btnClick
{
    WMLFunc
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
