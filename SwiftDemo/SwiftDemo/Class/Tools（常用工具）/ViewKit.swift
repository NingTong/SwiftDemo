
import UIKit

// MARK: - view 的 frame 属性方便调用
extension UIView {
    /// 起点 x
    var x: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            frame = CGRect(x: newValue, y: y, width: width, height: height)
        }
    }
    
    /// 起点 y
    var y: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            frame = CGRect(x: x, y: newValue, width: width, height: height)
        }
    }
    
    /// 宽
    var width: CGFloat {
        get {
            return frame.size.width
        }
        set {
            frame = CGRect(x: x, y: y, width: newValue, height: height)
        }
    }
    
    /// 高
    var height: CGFloat {
        get {
            return frame.size.height
        }
        set {
            frame = CGRect(x: x, y: y, width: width, height: newValue)
        }
    }
    
    /// 中心 x
    var midX: CGFloat {
        get {
            return x + width / 2
        }
        set {
            x = newValue - width / 2
        }
    }
    
    /// 中心 y
    var midY: CGFloat {
        get {
            return y + height / 2
        }
        set {
            y = newValue - height / 2
        }
    }
    
}

// 获取 view 所在的 viewcontroller
extension UIView {
    func getViewController() -> UIViewController? {

        for view in sequence(first: self.superview, next: {$0?.superview}) {

            if let responder = view?.next{

                if responder.isKind(of: UIViewController.self){

                    return responder as? UIViewController
                }
            }
        }
        return nil
    }
}
