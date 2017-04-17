//
//  QLBrightnessViewController.m
//  QLScreenBrightnessDemo
//
//  Created by qiu on 2017/4/17.
//  Copyright © 2017年 QiuFairy. All rights reserved.
//

/*!
 @note
 @abstract 屏幕变亮的页面
 */

#import "QLBrightnessViewController.h"
#import "QLBrightness.h"

//再次激活时，设置为调整后的亮度
extern NSString *const SetScreenBrightnessNotification;
//进入后台，杀掉进程后设置为默认亮度
extern NSString *const DefaultScreenBrightnessNotification;

@interface QLBrightnessViewController ()

@end

@implementation QLBrightnessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"仿支付屏幕变亮";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //监听post变化
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeSetBrightness) name:SetScreenBrightnessNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeDefaultBrightness) name:DefaultScreenBrightnessNotification object:nil];
    
    // 设置亮度
    [QLBrightness graduallySetBrightness:0.9 MainBrightness:[UIScreen mainScreen].brightness];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    // 恢复亮度
    [QLBrightness graduallyResumeBrightness];
}

#pragma mark -- 监听用户对进程的操作
-(void)changeSetBrightness{
    [QLBrightness graduallySetBrightness:0.9 MainBrightness:[UIScreen mainScreen].brightness];
}
-(void)changeDefaultBrightness{
    [QLBrightness graduallyResumeBrightness];
}

#pragma mark - 释放观察者
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:SetScreenBrightnessNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:DefaultScreenBrightnessNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
