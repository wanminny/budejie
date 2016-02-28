//
//  WMRecommendUserCell.h
//  不得姐
//
//  Created by wan on 16/2/28.
//  Copyright © 2016年 wan. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "WMUser.h"

@class WMUser;

@interface WMRecommendUserCell : UITableViewCell

/**  用户模型 */
@property (nonatomic,strong) WMUser *userRecommed;

@end
