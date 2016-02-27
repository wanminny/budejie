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


@interface WMRecommendCategoryController ()<UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *categoryTableView;


/** 分类模型数组 */
@property (nonatomic,strong) NSArray  *categoryArray;

@end

@implementation WMRecommendCategoryController


static NSString *categoryId = @"categorycell";


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"推荐关注";
    self.view.backgroundColor = WMVIEWBACKGROND(215, 215, 215);
    
    [self registerCell];
    
    [self sendRequest];
//    WMRecommendCategoryCell *cell = [NSBundle mainBundle] ;
}

-(void)registerCell
{
    [self.categoryTableView registerNib:[UINib nibWithNibName:NSStringFromClass([WMRecommendCategoryCell class]) bundle:nil] forCellReuseIdentifier:categoryId];
}

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
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        WMLog(@"FAIL:%@",error);
    }];

}

#pragma mark - <UITableViewDataSource>
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.categoryArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    WMRecommendCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:categoryId];
    
    cell.cateName = self.categoryArray[indexPath.row];
    
    return cell;
}


@end
