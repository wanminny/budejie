//
//  WMTabBarController.m
//  不得姐
//
//  Created by wan on 16/2/21.
//  Copyright © 2016年 wan. All rights reserved.
//

#import "WMTabBarController.h"
#import "WMEssenseViewController.h"
#import "WMFriendTrendViewController.h"
#import "WMMeViewController.h"
#import "WMNewViewController.h"
#import "WMNavController.h"
#import "WMTabBar.h"

@interface WMTabBarController ()

@end

@implementation WMTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpVc];
    
    WMTabBar *bar = [[WMTabBar alloc] init];
    
    
//    [UIBarButtonItem appearance];
//    [UINavigationBar appearance];
////    [UINavigationItem];
//    [UIBarItem appearance];
//    [UITabBarItem appearance];
    
//    [uitabbar];
    
//    WMLog(@"%@",self.tabBar.subviews);
    [self setValue:bar forKey:@"tabBar"];
    
//    self.tabBar = [[UITabBar alloc] init];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    WMLog(@"%@",self.tabBar.subviews);
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
//    WMLog(@"%@",self.tabBar.subviews);

    
}

//
//- (void)viewDidLayoutSubviews
//{
//    [super viewDidLayoutSubviews];
////    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
////    [btn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
////    [btn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
//////        [btn sizeToFit];
////    //    NSInteger width = self.tabBar.frame.size.width;
////    NSInteger height = self.tabBar.frame.size.height;
//////    btn.center = self.tabBar.center;
////    btn.frame = CGRectMake(0, 0, btn.currentBackgroundImage.size.width, height);
////    btn.backgroundColor = [UIColor blueColor];
////    WMLog(@"%zd,%zd,%d,%d",height,btn.currentBackgroundImage.size.width,self.tabBar.center.x,self.tabBar.center.y);
////    [self.tabBar addSubview:btn];
//}

/**
 *  建立初始化的子控制器
 */
-(void)setUpVc
{
    WMEssenseViewController *essensionVc = [[WMEssenseViewController alloc] init];
//    essensionVc.view.backgroundColor =[UIColor grayColor];
    essensionVc.tabBarItem.title =@"精华";
    essensionVc.tabBarItem.image = [UIImage imageNamed:@"tabBar_essence_icon"];
    essensionVc.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_essence_click_icon"];
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attr[NSForegroundColorAttributeName] = [UIColor colorWithRed:95/255.0 green:95/255.0 blue:95/255.0 alpha:1];
    [essensionVc.tabBarItem setTitleTextAttributes:attr forState:UIControlStateSelected];
    attr[NSForegroundColorAttributeName] = [UIColor colorWithRed:127/255.0 green:127/255.0 blue:127/255.0 alpha:1];
    [essensionVc.tabBarItem setTitleTextAttributes:attr forState:UIControlStateNormal];
    WMNavController *essNav = [[WMNavController alloc ]initWithRootViewController:essensionVc];
    [self addChildViewController:essNav];
    
    
    
    WMNewViewController *newVc = [[WMNewViewController alloc] init];
//    newVc.view.backgroundColor = [UIColor orangeColor];
    newVc.tabBarItem.title =@"新帖";
    newVc.tabBarItem.image = [UIImage imageNamed:@"tabBar_new_icon"];
    newVc.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_new_click_icon"];
    [newVc.tabBarItem setTitleTextAttributes:attr forState:UIControlStateSelected];
    [newVc.tabBarItem setTitleTextAttributes:attr forState:UIControlStateNormal];
    WMNavController *newNav = [[WMNavController alloc ]initWithRootViewController:newVc];
    [self addChildViewController:newNav];
    
    WMFriendTrendViewController *friendTrendVc = [[WMFriendTrendViewController alloc] init];
//    friendTrendVc.view.backgroundColor = [UIColor brownColor];
    friendTrendVc.tabBarItem.title = @"关注";
    friendTrendVc.tabBarItem.image =[UIImage imageNamed:@"tabBar_friendTrends_icon"];
    friendTrendVc.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_friendTrends_click_icon"];
    [friendTrendVc.tabBarItem setTitleTextAttributes:attr forState:UIControlStateSelected];
    [friendTrendVc.tabBarItem setTitleTextAttributes:attr forState:UIControlStateNormal];
    WMNavController *friendNav = [[WMNavController alloc ]initWithRootViewController:friendTrendVc];
    [self addChildViewController:friendNav];

    WMMeViewController *meVc = [[WMMeViewController alloc] init];
//    meVc.view.backgroundColor = [UIColor lightGrayColor];
    meVc.tabBarItem.title =@"我";
    meVc.tabBarItem.image =[UIImage imageNamed:@"tabBar_me_icon"];
    meVc.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_me_click_icon"];
    [meVc.tabBarItem setTitleTextAttributes:attr forState:UIControlStateSelected];
    [meVc.tabBarItem setTitleTextAttributes:attr forState:UIControlStateNormal];
    WMNavController *meNav = [[WMNavController alloc ]initWithRootViewController:meVc];
    [self addChildViewController:meNav];
    
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
