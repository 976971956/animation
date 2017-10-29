//
//  CALayer+JHLayerAnim.m
//  animationTest
//
//  Created by 李贻佳 on 2017/10/28.
//  Copyright © 2017年 liyijia. All rights reserved.
//

#import "CALayer+JHLayerAnim.h"

@implementation CALayer (JHLayerAnim)

-(void)jh_anim_Leida_color:(UIColor *)color runCount:(NSInteger)count time:(CGFloat)time{
    
    NSInteger pulsingCount = count;
    double animationDuration = time;
    CALayer *animationFather = [CALayer layer];
    for (int i = 0; i < pulsingCount; i++) {
        CALayer *lollayer = [CALayer layer];
        lollayer.frame = CGRectMake(0,0, self.frame.size.width, self.frame.size.width);
        lollayer.backgroundColor = color.CGColor;

        lollayer.cornerRadius = lollayer.frame.size.width / 2;

        CAAnimationGroup *groupanim = [CAAnimationGroup animation];
        groupanim.beginTime = CACurrentMediaTime() + (double)i * animationDuration / (double)pulsingCount;
        NSLog(@"%f",(double)i * animationDuration / (double)pulsingCount);
        groupanim.duration = animationDuration;
        groupanim.repeatCount = MAXFLOAT;
        groupanim.fillMode = kCAFillModeBackwards;
        groupanim.removedOnCompletion = NO;
        groupanim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];

        CABasicAnimation *basanim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        basanim.fromValue = @(0);
        basanim.toValue = @(1);
        
        CAKeyframeAnimation * opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
        opacityAnimation.values = @[@1, @0.9, @0.8, @0.7, @0.6, @0.5, @0.4, @0.3, @0.2, @0.1, @0];
        opacityAnimation.keyTimes = @[@0, @0.1, @0.2, @0.3, @0.4, @0.5, @0.6, @0.7, @0.8, @0.9, @1];


        groupanim.animations = @[basanim,opacityAnimation];

        [lollayer addAnimation:groupanim forKey:nil];

        [animationFather addSublayer:lollayer];

    }
    [self addSublayer:animationFather];
}

-(void)jh_anim_3dxuanzhuan_jiaodu:(CGFloat)mpi x:(NSInteger)x y:(NSInteger)y z:(NSInteger)z{
    CABasicAnimation *bas = [CABasicAnimation animationWithKeyPath:@"transform"];
    bas.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(mpi, x, y, z)];
    bas.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(mpi+M_PI, x, y, z)];
    bas.repeatCount = MAXFLOAT;
    [self addAnimation:bas forKey:nil];
    
}
-(void)jh_anim_jiangtoucolor:(UIColor *)color direction:(JH_JIANTOU)direct{
    CGFloat weight = 60;
    CGFloat height = 20;
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = CGRectMake(0, 0, weight, height);
    layer.lineWidth = 5;
    layer.strokeColor = color.CGColor;
    layer.fillColor = [UIColor clearColor].CGColor;
    //    layer.backgroundColor = [UIColor blackColor].CGColor;
    [self addSublayer:layer];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //    上下的间距
    CGFloat morg = (self.frame.size.height-layer.frame.size.height)/2;
    CGFloat morgw = (self.frame.size.width-layer.frame.size.width)/2;

    CABasicAnimation *anim = [CABasicAnimation animation];
    
    switch (direct) {
        case JT_TOP:
        {


            
            layer.frame = CGRectMake(0, 0, weight, height);
            //    上下的间距
            morg = (self.frame.size.height-layer.frame.size.height)/2;
            layer.position = CGPointMake(self.frame.size.width/2.0,self.frame.size.height/2+morg);
            
            anim.keyPath = @"position.y";
            anim.toValue = [NSNumber numberWithFloat:self.frame.size.height/2+morg-40];
            
            [path moveToPoint:CGPointMake(0, layer.frame.size.height)];
            [path addLineToPoint:CGPointMake(layer.frame.size.width/2, 0)];
            [path addLineToPoint:CGPointMake(layer.frame.size.width, layer.frame.size.height)];
        }
            break;
        case JT_LEFTER:
        {
            layer.frame = CGRectMake(0, 0, height, weight);
            //    上下的间距
            morgw = (self.frame.size.width-layer.frame.size.width)/2;
            layer.position = CGPointMake(self.frame.size.width/2.0+morgw,self.frame.size.height/2);
            
            anim.keyPath = @"position.x";
            anim.toValue = [NSNumber numberWithFloat:layer.position.x-40];
            
            [path moveToPoint:CGPointMake(layer.frame.size.width, layer.frame.size.height)];
            [path addLineToPoint:CGPointMake(0, layer.frame.size.height/2)];
            [path addLineToPoint:CGPointMake(layer.frame.size.width, 0)];
        }
            break;
        case JT_BOTTON:
        {
            layer.frame = CGRectMake(0, 0, weight, height);
            //    上下的间距
            morg = (self.frame.size.height-layer.frame.size.height)/2;
            layer.position = CGPointMake(self.frame.size.width/2.0,layer.frame.size.height/2);

            anim.keyPath = @"position.y";
            anim.toValue = [NSNumber numberWithFloat:layer.position.y+40];
            
            [path moveToPoint:CGPointMake(0, 0)];
            [path addLineToPoint:CGPointMake(layer.frame.size.width/2, layer.frame.size.height)];
            [path addLineToPoint:CGPointMake(layer.frame.size.width, 0)];
        }
            break;
        case JT_RIGHT:
        {
            layer.frame = CGRectMake(0, 0, height, weight);
            //    上下的间距
            morgw = (self.frame.size.width-layer.frame.size.width)/2;
            layer.position = CGPointMake(layer.frame.size.width/2,self.frame.size.height/2);

            anim.keyPath = @"position.x";
            anim.toValue = [NSNumber numberWithFloat:layer.position.x+40];
            
            [path moveToPoint:CGPointMake(0, 0)];
            [path addLineToPoint:CGPointMake(layer.frame.size.width, layer.frame.size.height/2)];
            [path addLineToPoint:CGPointMake(0, layer.frame.size.height)];
        }
            break;
        default:
            break;
    }

    //    [path closePath];
    layer.path = path.CGPath;
    
   
    
    CABasicAnimation *animapa = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animapa.toValue = [NSNumber numberWithDouble:0];
    
    CAAnimationGroup *groupanim = [CAAnimationGroup animation];
    groupanim.repeatCount = MAXFLOAT;
    groupanim.duration = 2.0;
    groupanim.animations = @[anim,animapa];
    groupanim.fillMode = kCAFillModeForwards;
    groupanim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [layer addAnimation:groupanim forKey:nil];
}
@end
