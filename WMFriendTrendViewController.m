
//
//  WMFriendTrendViewController.m
//  不得姐
//
//  Created by wan on 16/2/21.
//  Copyright © 2016年 wan. All rights reserved.
//

#import "WMFriendTrendViewController.h"
#import "WMRecommendCategoryController.h"

@interface WMFriendTrendViewController ()

@end

@implementation WMFriendTrendViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title =@"关注";
    
    self.view.backgroundColor = WMVIEWBACKGROND(215, 215, 215);
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"friendsRecommentIcon"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"friendsRecommentIcon-click"] forState:UIControlStateHighlighted];
    [btn sizeToFit];
    
    [btn addTarget:self action:@selector(trendClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem =[[UIBarButtonItem alloc] initWithCustomView:btn];
    
}

-(void)trendClick
{
    [self.navigationController pushViewController:[[WMRecommendCategoryController alloc] init] animated:YES];
//    WMLFunc;
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
