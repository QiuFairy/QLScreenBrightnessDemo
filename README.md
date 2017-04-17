# QLScreenBrightnessDemo
###仿支付宝二维码页面，多线程逐步调整屏幕亮度。

##使用方法

```objc
// 设置亮度
//首个参数：0.9可以随意更换，第二个参数则不需要改变
[QLBrightness graduallySetBrightness:0.9 MainBrightness:[UIScreen mainScreen].brightness];
```
```objc
// 恢复亮度
//在相应的地方加上此方法即可
[QLBrightness graduallyResumeBrightness];
```
##Note
```objc
本项目在AppDelegate中添加上NSNotificationCenter来判断app进入后台和从底部划出操作栏的亮度变化，详情请查看AppDelegate中的方法。
```

# BY QiuFairy 
