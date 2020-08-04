// 全局工具类宏定义
#ifndef define_h
#define define_h

//获取系统对象
#define kApplication        [UIApplication sharedApplication]
#define kWindow             [UIApplication sharedApplication].delegate.window
#define kAppDelegate        [AppDelegate shareAppDelegate]
#define kRootVC             [UIApplication sharedApplication].delegate.window.rootViewController
#define kUserDefaults       [NSUserDefaults standardUserDefaults]
#define kNoti               [NSNotificationCenter defaultCenter]

//获取屏幕宽高
#define kScreenW            [[UIScreen mainScreen] bounds].size.width
#define kScreenH            [[UIScreen mainScreen] bounds].size.height

//对比x宽高比例
#define scaleW              kScreenW/414.f
#define scaleH              kScreenH/896.f

// 判断是否是iPhone X系列
#define kIs_iphone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

#define iPhoneX kScreenW >= 375.0f && kScreenH >= 812.0f && kIs_iphone
// 状态栏高度
#define statusBarH          (iPhoneX ? 44.f : 20.f)
// 导航栏高度
#define navBarH             (iPhoneX ? 88.f : 64.f)
// 不带状态栏的导航栏高度
#define navNoStatusBarH     44.f
// tabBar高度
#define tabBarH             (iPhoneX ? (49.f+34.f) : 49.f)

// 弱引用
#define WEAK_SELF           __weak typeof(self) weakSelf = self
#define STRONG_SELF         __strong __typeof(weakSelf) strongSelf = weakSelf;

// 当前系统版本
#define kVersion            [[UIDevice currentDevice].systemVersion doubleValue]

//view边框颜色宽度以及切角和阴影
#define ViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\

#define ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

#define ViewBorderRadiusShadow(View, Radius, borderWidth, borderColor, shadowColor, shadowAlpha, shadowRadius, shadowRect)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setBorderWidth:(borderWidth)];\
[View.layer setBorderColor:[borderColor CGColor]];\
[View.layer setShadowColor:[shadowColor CGColor]];\
[View.layer setShadowOpacity:(shadowAlpha)];\
[View.layer setShadowRadius:(shadowRadius)];\
[View.layer setShadowOffset:shadowRect];\


//多语言
#define kLanguage(Text)     [[ChangeLanguage bundle] localizedStringForKey:Text value:nil table:@"LanguageManager"]

// 打印日志
#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

// 发送通知
#define kPostNoti(name,obj,dic) [[NSNotificationCenter defaultCenter] postNotificationName:name object:obj userInfo:dic];

#endif
