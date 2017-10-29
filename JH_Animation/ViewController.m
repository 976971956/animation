//
//  ViewController.m
//  JH_Animation
//
//  Created by 李贻佳 on 2017/10/28.
//  Copyright © 2017年 liyijia. All rights reserved.
//

#import "ViewController.h"
#import "CALayer+JHLayerAnim.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *leidaview;
@property (weak, nonatomic) IBOutlet UIView *xuanzhuangview;
@property (weak, nonatomic) IBOutlet UIView *jiantouview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [_leidaview.layer jh_anim_Leida_color:[UIColor redColor] runCount:4 time:6];
    UIButton *BU = [UIButton buttonWithType:UIButtonTypeCustom];
    _xuanzhuangview.layer.cornerRadius = 30;
    [_xuanzhuangview.layer jh_anim_3dxuanzhuan_jiaodu:M_PI_4 x:1 y:0 z:1];
    
    [_jiantouview.layer jh_anim_jiangtoucolor:[UIColor redColor] direction:JT_BOTTON];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
