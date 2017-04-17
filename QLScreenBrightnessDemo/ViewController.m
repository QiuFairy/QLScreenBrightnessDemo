//
//  ViewController.m
//  QLScreenBrightnessDemo
//
//  Created by qiu on 2017/4/17.
//  Copyright © 2017年 QiuFairy. All rights reserved.
//

#import "ViewController.h"

#import "QLBrightnessViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btnClick = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 200, 44)];
    btnClick.backgroundColor = [UIColor lightGrayColor];
    [btnClick setTitle:@"Brightness Btn" forState:UIControlStateNormal];
    [btnClick addTarget:self action:@selector(pushBrightnessVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnClick];
}

-(void)pushBrightnessVC{
    QLBrightnessViewController *QLBrightnessVC = [[QLBrightnessViewController alloc]init];
    [self.navigationController pushViewController:QLBrightnessVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
