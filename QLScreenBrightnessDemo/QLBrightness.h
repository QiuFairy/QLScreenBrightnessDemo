//
//  QLBrightness.h
//  QLScreenBrightnessDemo
//
//  Created by qiu on 2017/4/17.
//  Copyright © 2017年 QiuFairy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QLBrightness : NSObject

/*!
 @method
 @abstract 逐步设置亮度
 */
+ (void)graduallySetBrightness:(CGFloat)value MainBrightness:(CGFloat)mainBrightness;

/*!
 @method
 @abstract 逐步恢复亮度
 */
+ (void)graduallyResumeBrightness;
@end
