//
//  WMEssenseViewController.m
//  不得姐
//
//  Created by wan on 16/2/21.
//  Copyright © 2016年 wan. All rights reserved.
//

#import "WMEssenseViewController.h"
#import "WMTestViewController.h"

@interface WMEssenseViewController ()

@end

@implementation WMEssenseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title =@"精华";
    
    self.view.backgroundColor = WMVIEWBACKGROND(215, 215, 215);

    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"MainTagSubIcon"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"MainTagSubIconClick"] forState:UIControlStateHighlighted];
    
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [btn sizeToFit];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
//    self.navigationItem.backBarButtonItem = [uita];
//    self.tabBarItem
    
    
}

-(void)click
{
    WMLog(@"%s",__func__);
//    WMLFunc
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    [self.navigationController pushViewController:[[WMTestViewController alloc ]init] animated:YES];
//    self.navigationController.hidesBarsOnTap = YES;
//    self.tabBarController.hidesBottomBarWhenPushed = YES;
//    self.navigationController.hidesBottomBarWhenPushed = YES;
//   [self.navigationController presentViewController:[[WMTestViewController alloc] init] animated:YES completion:^{
//       
//       
//   } ];
    
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
