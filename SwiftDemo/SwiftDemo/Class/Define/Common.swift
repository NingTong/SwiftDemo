

import UIKit

// 获取沙盒 Document 路径
let kDocumentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
// 获取沙盒 Cache 路径
let kCachePath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first
// 获取沙盒 temp 路径
let kTempPath = NSTemporaryDirectory()

// 颜色
func rgba(_ r: CGFloat,_ g: CGFloat,_ b: CGFloat,_ a: CGFloat) -> UIColor {
    return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}
func rgb(_ r: CGFloat,_ g: CGFloat,_ b: CGFloat) -> UIColor {
    return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
}
func hexa(_ HexString: String,_ a: CGFloat) ->UIColor {
    return UIColor.colorWith(hexString: HexString, alpha: a)
}
func hex(_ HexString: String) ->UIColor {
    return UIColor.colorWith(hexString: HexString)
}
// app 背景色
let kBaseColor = rgba(5, 14, 68, 1)

// 开发的时候打印，但是发布的时候不打印,使用方法，输入 print(message: "输入")
func print<T>(message: T, fileName: String = #file, methodName: String = #function, lineNumber: Int = #line) {
    #if DEBUG
    // 获取当前时间
    let now = Date()
    // 创建一个日期格式器
    let dformatter = DateFormatter()
    dformatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
    // 要把路径最后的字符串截取出来
    let lastName = ((fileName as NSString).pathComponents.last!)
    print("\(dformatter.string(from: now)) [\(lastName)][第\(lineNumber)行] \n\t\t \(message)")
    #endif
}

// UserDefaults 操作
let kUserDefaults = UserDefaults.standard
func kUserDefaultsRead(_ KeyStr: String) -> String {
    return kUserDefaults.string(forKey: KeyStr)!
}
func kUserDefaultsWrite(_ obj: Any, _ KeyStr: String) {
    kUserDefaults.set(obj, forKey: KeyStr)
}
func kUserValue(_ A: String) -> Any? {
    return kUserDefaults.value(forKey: A)
}

// 获取屏幕大小
let kScreenSize = UIScreen.main.responds(to: #selector(getter: UIScreen.nativeBounds)) ? CGSize(width: UIScreen.main.nativeBounds.size.width / UIScreen.main.nativeScale, height: UIScreen.main.nativeBounds.size.height / UIScreen.main.nativeScale) : UIScreen.main.bounds.size
let kScreenW = kScreenSize.width
let kScreenH = kScreenSize.height
let kScreenBounds = UIScreen.main.bounds

// APP版本号
let kAppVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"]
// 当前系统版本号
let kVersion = (UIDevice.current.systemVersion as NSString).floatValue

//获取当前语言
let kAppCurrentLanguage = Locale.preferredLanguages[0]

//机型判断
let kIphoneX = (kScreenH > 780.0)

//获取状态栏、标题栏、导航栏高度
let StatusBarH: CGFloat = kIphoneX ? 44 : 20
let NavHeight: CGFloat =  kIphoneX ? 88 : 64
let TabbarHeight: CGFloat = kIphoneX ? 83 : 49

// 注册通知
func kNoti_Add(observer: Any, selector: Selector, name: String) {
    return NotificationCenter.default.addObserver(observer, selector: selector, name: Notification.Name(rawValue: name), object: nil)
}
// 发送通知
func kNoti_Post(name: String, object: Any) {
    return NotificationCenter.default.post(name: Notification.Name(rawValue: name), object: object)
}
// 移除通知
func kNoti_Remove(observer: Any, name: String) {
    return NotificationCenter.default.removeObserver(observer, name: Notification.Name(rawValue: name), object: nil)
}

//代码缩写
let kApplication = UIApplication.shared
let kWindow = kApplication.windows.first { $0.isKeyWindow }
let kAppDelegate = kApplication.delegate
let kNoti = NotificationCenter.default
let kRootVC = kAppDelegate?.window??.rootViewController

//字体 字号
func sFont(_ a: CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: a)
}
func bFont(_ a: CGFloat) -> UIFont {
    return UIFont.boldSystemFont(ofSize: a)
}

// 圆角边框阴影
func ViewRadius(view: UIView, radius: CGFloat) {
    view.layer.cornerRadius = radius
    view.layer.masksToBounds = true
}

func ViewBorderRadius(view: UIView, radius: CGFloat, width: CGFloat, color: UIColor) {
    view.layer.cornerRadius = radius
    view.layer.masksToBounds = true
    view.layer.borderWidth = width
    view.layer.borderColor = color.cgColor
}

// 根据文字内容和字体返回宽高
func textW(text: String!, font: UIFont!) -> CGFloat {
    let rect = NSString(string: text).boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: font.pointSize + 6), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font as Any], context: nil)
    return ceil(rect.width)
}

func textH(text: String!, font: UIFont!, width: CGFloat) -> CGFloat {
    let rect = NSString(string: text).boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font as Any], context: nil)
    return ceil(rect.height)
}

/**
 字符串是否为空
 @param str NSString 类型 和 子类
 @return  BOOL类型 true or false
 */
func kStringIsEmpty(_ str: String!) -> Bool {
    if str.isEmpty {
        return true
    }
    if str == nil {
        return true
    }
    if str.count < 1 {
        return true
    }
    if str == "(null)" {
        return true
    }
    if str == "null" {
        return true
    }
    return false
}
// 字符串判空 如果为空返回@“”
func kStringNullToempty(_ str: String) -> String {
    let resutl = kStringIsEmpty(str) ? "" : str
    return resutl
}
func kStringNullToReplaceStr(_ str: String,_ replaceStr: String) -> String {
    let resutl = kStringIsEmpty(str) ? replaceStr : str
    return resutl
}

/**
 数组是否为空
 @param array NSArray 类型 和 子类
 @return BOOL类型 true or false
 */
func kArrayIsEmpty(_ array: [String]) -> Bool {
    let str: String! = array.joined(separator: "")
    if str == nil {
        return true
    }
    if str == "(null)" {
        return true
    }
    if array.count == 0 {
        return true
    }
    if array.isEmpty {
        return true
    }
    return false
}
/**
 字典是否为空
 @param dic NSDictionary 类型 和子类
 @return BOOL类型 true or false
 */
func kDictIsEmpty(_ dict: NSDictionary) -> Bool {
    let str: String! = "\(dict)"
    if str == nil {
        return true
    }
    if str == "(null)" {
        return true
    }
    if dict .isKind(of: NSNull.self) {
        return true
    }
    if dict.allKeys.count == 0 {
        return true
    }
    return false
}



