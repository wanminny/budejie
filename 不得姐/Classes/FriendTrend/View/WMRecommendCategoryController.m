//
//  WMRecommendCategoryController.m
//  不得姐
//
//  Created by wan on 16/2/27.
//  Copyright © 2016年 wan. All rights reserved.
//

#import "WMRecommendCategoryController.h"
#import "WMRecommendCategoryCell.h"
#import <AFNetworking/AFNetworking.h>
#import <MJExtension/MJExtension.h>
#import <SVProgressHUD/SVProgressHUD.h>
#import "WMUser.h"
#import "WMRecommendUserCell.h"


@interface WMRecommendCategoryController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *categoryTableView;

@property (weak, nonatomic) IBOutlet UITableView *userTableView;

/** 分类模型数组 */
@property (nonatomic,strong) NSArray  *categoryArray;


/** 用户数组 */
@property (nonatomic,strong) NSArray  *userArray;

@end

@implementation WMRecommendCategoryController


static NSString *categoryId = @"categorycell";

static  NSString *userId = @"usercell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"推荐关注";
    self.view.backgroundColor = WMVIEWBACKGROND(215, 215, 215);
    
    [self registerCell];
    
    [self sendRequest];
    
    self.userTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    
//    WMRecommendCategoryCell *cell = [NSBundle mainBundle] ;
}

-(void)registerCell
{
    [self.categoryTableView registerNib:[UINib nibWithNibName:NSStringFromClass([WMRecommendCategoryCell class]) bundle:nil] forCellReuseIdentifier:categoryId];
    
    
    [self.userTableView registerNib:[UINib nibWithNibName:NSStringFromClass([WMRecommendUserCell  class])bundle:nil] forCellReuseIdentifier:userId ];
}

/*!
 *  @author wan, 16-02-29 17:02:15
 *
 *  @brief test github  
 *
 *  @since <#version number#>
 */
-(void)sendRequest
{

    NSString *baseUrl = @"http://api.budejie.com/api/api_open.php";
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    params[@"a"] = @"category";
    params[@"c"] =@"subscribe";
    //get请求；
    
    [SVProgressHUD show];
    [session GET:baseUrl parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        WMLog(@"progress!");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        
//        WMLog(@"%@",responseObject[@"list"]);
        self.categoryArray = [WMCategory mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];

 
        [self.categoryTableView reloadData];
        NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:0];
        
//        [self.categoryTableView selectRowAtIndexPath:path animated:NO scrollPosition:UITableViewScrollPositionBottom];
        
         [self.categoryTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        WMLog(@"FAIL:%@",error);
    }];

}

#pragma mark - <UITableViewDataSource>
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView == self.categoryTableView)
    {
            return self.categoryArray.count;
    }
    else
    {
        return  self.userArray.count;
    }

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(tableView == self.categoryTableView)
    {
        WMRecommendCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:categoryId];
        
        cell.cateName = self.categoryArray[indexPath.row];
        
        return cell;
    }
    else
    {
        WMRecommendUserCell *cell = [tableView dequeueReusableCellWithIdentifier:userId];
        cell.userRecommed = self.userArray[indexPath.row];
        return cell;
    }

}


#pragma mark - <uitableviewdelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *baseUrl = @"http://api.budejie.com/api/api_open.php";
    
    WMCategory *cate = self.categoryArray[indexPath.row];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"]= @"list";
    params[@"c"] =@"subscribe";
    params[@"category_id"] = [ NSNumber numberWithInteger:cate.id];
    
    [[AFHTTPSessionManager manager] GET:baseUrl parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        self.userArray = [WMUser mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        

        
        [self.userTableView reloadData];
        
        
//        WMLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        WMLog(@"%@",error);
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    
//    if(tableView == self.categoryTableView)
//    {
//        return 40;
//    }
    return 70;
}

@end
