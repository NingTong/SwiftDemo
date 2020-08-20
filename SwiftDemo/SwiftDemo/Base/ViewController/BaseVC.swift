
import UIKit

import RxSwift

import RxCocoa

class BaseVC: UIViewController {
    
    // 状态栏文字颜色
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent    //  白色
    }
    
    lazy var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = kBaseColor
        
        // 判断是否为 跟视图控制器
        if self.navigationController!.viewControllers.count > 1 {
            // 重写返回按钮
            self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "back"), style: .plain, target: self, action: #selector(back))
        }
    }
    
    // 重写返回方法
    @objc func back(){
        self.navigationController?.popViewController(animated: true)
    }
    
    // 添加右侧自定义按钮
    func setRightItem(view: UIView) {
        let rightItem = UIBarButtonItem.init(customView: view)
        
        self.navigationItem.rightBarButtonItem = rightItem
    }
}

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
