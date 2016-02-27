//
//  WMNavController.m
//  不得姐
//
//  Created by wan on 16/2/21.
//  Copyright © 2016年 wan. All rights reserved.
//

#import "WMNavController.h"

@interface WMNavController ()

@end

@implementation WMNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //NSLog(@"%@",self.class);
    if(self.childViewControllers.count > 0)
    {
        viewController.hidesBottomBarWhenPushed = YES;
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [btn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];//靠左边对齐
        [btn sizeToFit];
        [btn setTitle:@"返回" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        btn.frame = CGRectMake(0, 0, 60, 30);
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);//向左边移动10
        [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
//        btn.backgroundColor = [UIColor blueColor];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
        
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        [button setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
//        [button setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
////        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//        [button setTitle:@"返回" forState:UIControlStateNormal];
//        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
////        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
////        button.bounds = CGRectMake(0, 0, 70, 30);
////        button.contentEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
////        button.titleLabel.font = [UIFont systemFontOfSize:15];
//        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        
        
    }
    [super pushViewController:viewController animated:animated];//  该位置注意！

    
//    viewController.tabBarController.hidesBottomBarWhenPushed = YES;
}

-(void)back
{
    [self popViewControllerAnimated:YES];
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
