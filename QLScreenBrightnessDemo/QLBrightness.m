//
//  QLBrightness.m
//  QLScreenBrightnessDemo
//
//  Created by qiu on 2017/4/17.
//  Copyright © 2017年 QiuFairy. All rights reserved.
//

/*!
 @note
 @abstract 此处未加上app进入后台和从底部划出操作栏的亮度变化
 @resolve 在AppDelegate中添加上NSNotificationCenter来判断此操作
 */

#import "QLBrightness.h"

static CGFloat _currentBrightness;
static NSOperationQueue *_queue;

#define QLScreenBrightness [UIScreen mainScreen].brightness

@implementation QLBrightness

+ (void)graduallySetBrightness:(CGFloat)value MainBrightness:(CGFloat)mainBrightness{
    _currentBrightness = mainBrightness;
    
    if (!_queue) {
        _queue = [[NSOperationQueue alloc] init];
        _queue.maxConcurrentOperationCount = 1;
    }
    [_queue cancelAllOperations];
    
    CGFloat brightness = QLScreenBrightness;
    CGFloat step = 0.005 * ((value > brightness) ? 1 : -1);
    int times = fabs((value - brightness) / 0.005);
    for (CGFloat i = 1; i < times + 1; i++) {
        [_queue addOperationWithBlock:^{
            [NSThread sleepForTimeInterval:1 / 300.0];
            QLScreenBrightness = brightness + i * step;
        }];
    }
}

+ (void)graduallyResumeBrightness{
    [self graduallySetBrightness:_currentBrightness MainBrightness:_currentBrightness];
    
}
@end
