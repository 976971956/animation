//
//  CALayer+JHLayerAnim.h
//  animationTest
//
//  Created by 李贻佳 on 2017/10/28.
//  Copyright © 2017年 liyijia. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

typedef enum JH_JIANTOU {
    JT_TOP  = 0,
    JT_LEFTER,
    JT_BOTTON,
    JT_RIGHT,
} JH_JIANTOU;

@interface CALayer (JHLayerAnim)

/**
 雷达效果
 @param color 颜色
 @param count 波浪次数
 @param time 一次循环的时间
 */
-(void)jh_anim_Leida_color:(UIColor *)color runCount:(NSInteger)count time:(CGFloat)time;

/**
 旋转的view

 @param mpi 初始角度
 @param x x
 @param y y
 @param z z
 */
-(void)jh_anim_3dxuanzhuan_jiaodu:(CGFloat)mpi x:(NSInteger)x y:(NSInteger)y z:(NSInteger)z;

/**
 箭头指向

 @param color 箭头颜色
 @param direct 箭头方向
 */
-(void)jh_anim_jiangtoucolor:(UIColor *)color direction:(JH_JIANTOU)direct;
@end
