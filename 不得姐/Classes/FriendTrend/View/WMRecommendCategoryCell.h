//
//  WMRecommendCategoryCell.h
//  不得姐
//
//  Created by wan on 16/2/27.
//  Copyright © 2016年 wan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WMCategory.h"

@interface WMRecommendCategoryCell : UITableViewCell
/** 推荐的分类 */
@property (nonatomic,strong) WMCategory  *cateName;
@end
