//
//  WMCategory.h
//  不得姐
//
//  Created by wan on 16/2/27.
//  Copyright © 2016年 wan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WMCategory : NSObject
/** id */
@property (nonatomic,assign) NSInteger  id;
/** 推荐名称 */
@property (nonatomic,strong) NSString  *name;
/** 关注数目*/
@property (nonatomic,assign) NSInteger  count;

@end
