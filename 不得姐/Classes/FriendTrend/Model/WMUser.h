//
//  WMUser.h
//  不得姐
//
//  Created by wan on 16/2/28.
//  Copyright © 2016年 wan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WMUser : NSObject


/** 图像 */
@property (nonatomic,strong) NSString  *header;

/** 名称 */
@property (nonatomic,strong) NSString  *screen_name;

/** 粉丝数目 */
@property (nonatomic,assign) NSInteger  fans_count;

@end
