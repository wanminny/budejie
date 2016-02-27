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


@interface WMRecommendCategoryController ()<UITableViewDataSource>

@end

@implementation WMRecommendCategoryController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"推荐关注";
    self.view.backgroundColor = WMVIEWBACKGROND(215, 215, 215);
    
    [self sendRequest];
//    WMRecommendCategoryCell *cell = [NSBundle mainBundle] ;
}


-(void)sendRequest
{

    NSString *baseUrl = @"http://api.budejie.com/api/api_open.php";
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    params[@"a"] = @"category";
    params[@"c"] =@"subscribe";
    
//    ///
    /*!
     *  @author wan, 16-02-27 17:02:06
     *
     *  @brief <#Description#>
     *
     *  @param downloadProgress <#downloadProgress description#>
     *
     *  @return <#return value description#>
     *
     *  @since <#version number#>
     */
    
    
    [session GET:baseUrl parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        WMLog(@"progress!");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        WMLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        WMLog(@"FAIL:%@",error);
    }];
//
//    [session GET:baseUrl parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        WMLog(@"success");
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        WMLog(@"失败");
//    }];
}

#pragma mark - <UITableViewDataSource>
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"categorycell"];
    
    return cell;
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
