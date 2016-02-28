//
//  WMRecommendUserCell.m
//  不得姐
//
//  Created by wan on 16/2/28.
//  Copyright © 2016年 wan. All rights reserved.
//

#import "WMRecommendUserCell.h"
#import "UIImageView+WebCache.h"
#import "WMUser.h"


@interface WMRecommendUserCell ()

@property (weak, nonatomic) IBOutlet UIImageView *picImageView;
@property (weak, nonatomic) IBOutlet UILabel *userName;

@property (weak, nonatomic) IBOutlet UILabel *count;
@end


@implementation WMRecommendUserCell


- (void)setUserRecommed:(WMUser *)userRecommed
{
    _userRecommed = userRecommed;
    
    [self.picImageView sd_setImageWithURL:[NSURL URLWithString:userRecommed.header]];
   
    self.userName.text = userRecommed.screen_name;
    
    self.count.text = [NSString stringWithFormat:@"%ld 人关注",(long)userRecommed.fans_count];
    
}

- (void)awakeFromNib {
    
    self.userName.font = [UIFont systemFontOfSize:10];
    self.count.font = [UIFont systemFontOfSize:10];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
