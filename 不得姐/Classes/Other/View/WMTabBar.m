//
//  WMTabBar.m
//  不得姐
//
//  Created by wan on 16/2/21.
//  Copyright © 2016年 wan. All rights reserved.
//

#import "WMTabBar.h"

@interface WMTabBar()

/** 中间的按钮 */
@property (nonatomic,strong) UIButton  *plusBtn;

@end

@implementation WMTabBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

/**
 *  懒加载
 *
 *  @return UIButton *
 */
-(UIButton *)plusBtn
{
    if(!_plusBtn)
    {
//        _plusBtn = [[UIButton alloc] init];
        UIButton *btn  = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [btn addTarget:self action:@selector(publish) forControlEvents:UIControlEventTouchUpInside];

//        [btn sizeToFit];
        [self addSubview:btn];
        
        _plusBtn = btn;

    }
    return _plusBtn;
}

-(void)publish
{
    WMLFunc;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
//    NSInteger x = 0;
    NSInteger y = 0;
    NSInteger width = self.frame.size.width/5;
    NSInteger height = self.frame.size.height;
    
    NSInteger i = 0;
    
//    WMLog(@"%@",self.subviews);
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {

            if(i == 2)
            {
                self.plusBtn.frame = CGRectMake(i*width, y, self.plusBtn.currentBackgroundImage.size.width , self.plusBtn.currentBackgroundImage.size.height);
                self.plusBtn.backgroundColor = [UIColor blueColor];
                i++;
            }
            view.frame = CGRectMake(i*width, y, width, height);
            i++;
        }
    }

//    self.plusBtn.center = self.center;
}

@end
