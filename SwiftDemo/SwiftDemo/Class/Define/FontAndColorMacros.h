//字体大小和颜色配置
#ifndef FontAndColorMacros_h
#define FontAndColorMacros_h

#pragma mark - ——————— 颜色 ————————
#pragma mark - 设置颜色
// rgb
#define rgba(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
// hex
#define kHexColor(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:1]

#pragma mark - 常用颜色
// app主要色调（导航栏，按钮，tabbar文字选择颜色等）
#define kBaseColor  kHexColor(0x040F45)
// 常用文字黑色
#define kTextColor  kHexColor(333333)
// 常用 placeHolder 文字颜色
#define kPlaceHolder  kHexColor(0x9BAED9)

#pragma mark - ——————— 字体 ————————
// 加粗字体
#define bFont(FONTSIZE) [UIFont bFontOfSize:(kScreenW <= 375) ? FONTSIZE : (FONTSIZE + 1)]
// 系统字体
#define sFont(FONTSIZE) [UIFont sFontOfSize:(kScreenW <= 375) ? FONTSIZE : (FONTSIZE + 1)]

#endif
