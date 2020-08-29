
import UIKit

import Moya

// 用来主动取消网络请求
var cancelableRequest: Cancellable?

// 遵循这个协议，可以隐藏导航栏
protocol HideNavigationBarProtocol where Self: UIViewController {
}

class RootNavigationVC: UINavigationController, UINavigationControllerDelegate, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self;
    }

    // 根视图禁止右滑返回
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        let translation: CGPoint = gestureRecognizer.location(in: gestureRecognizer.view);
        
        if translation.x <= 0 {
            return false
        }
        
        return self.viewControllers.count == 1 ? false : true
    }
    
    // push 方法
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            if self.viewControllers.last!.isKind(of: viewController.classForCoder) {
                return
            }
        }
        
        /* 自动显示和隐藏tabbar */
        viewController.hidesBottomBarWhenPushed = (self.children.count > 0) ? true : false
        
        super.pushViewController(viewController, animated: animated)
    }
    
    override func popViewController(animated: Bool) -> UIViewController? {
        // 界面销毁时，取消请求
        cancelableRequest?.cancel()
        print(message: "取消请求")
        
        return super.popViewController(animated: animated)
    }
    
    // 根据控制器名称返回控制器对象
    func getCurrentViewControllerClass(className: String!) -> AnyObject? {
        let classObj: AnyClass! = NSClassFromString(className)
        
        for vc in self.viewControllers {
            if vc.isMember(of: classObj) {
                return vc
            }
        }
        
        return nil
    }
    
    // 返回到指定的类视图
    func popToAppointViewController(className: String?, animated: Bool?) -> Bool {
        let vc: AnyObject! = self.getCurrentViewControllerClass(className: className)
        
        if vc != nil && vc.isKind(of: UIViewController.classForCoder()) {
            self.popToViewController(vc as! UIViewController, animated: true)
            
            return true
        }
        
        return false
    }
    
    // 导航控制器将要显示控制器时调用
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if viewController is HideNavigationBarProtocol {
            self.setNavigationBarHidden(true, animated: true)
        }
        else {
            self.setNavigationBarHidden(false, animated: true)
        }
    }
}
