
import UIKit

// MARK: - 枚举
// 界面移动中的状态
enum MovingStateEnumes {
    case Stanby
    case Began
    case Changed
    case End
    case Decelerating
}


// MARK: - 参数设置
// 动画时长
let AnimationDuration: Float = 0.5

// 最小水平位移
let MinX: CGFloat = CGFloat(0.3 * kScreenW)


class DebugNavigationVC: UINavigationController, UIGestureRecognizerDelegate {
    // 是否关闭右滑返回，默认 false
    var disableDrag: Bool = false
    
    // 黑色的蒙版
    var lastScreenBlackMask: UIView!
    
    // 显示上一个界面的截屏
    var lastScreenShotView: UIImageView!
    
    // 移动中的状态
    var movingState: MovingStateEnumes!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 为导航控制器 view，添加拖拽手势
        let pan: UIPanGestureRecognizer = UIPanGestureRecognizer.init()
        
        pan.addTarget(self, action: #selector(paningGestureReceive(recoginzer:)))
        
        pan.delegate = self
        
        pan.delaysTouchesBegan = true
        
        self.view.addGestureRecognizer(pan)
    }
    
    
    // MARK: - 截屏相关方法
    // 当前导航栏界面截屏
    func capture() -> UIImage! {
        var view: UIView! = self.view
        
        if (self.tabBarController != nil) {
            view = self.tabBarController?.view
        }
        
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.isOpaque, 0.0)
        view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return img
    }
    
    // 得到 OC 对象的指针字符串
    func pointer(object: CVarArg!) -> String! {
        return NSString(format: "%p", object) as String
    }
    
    // 获取前一个界面的截屏
    func lastScreenShot() -> UIImage! {
        let lastVC: UIViewController! = self.viewControllers[self.viewControllers.count - 2]
        
        return (self.screenShotsDict.object(forKey: self.pointer(object: lastVC)!) as! UIImage)
    }
    
    
    // MARK: - 监听导航栏控制器的改变 截屏
    // push 前，添加当前界面的截屏
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            self.screenShotsDict.setObject(self.capture()!, forKey: self.pointer(object: self.topViewController)! as NSCopying)
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    // pop 后，移除当前界面截屏
    override func popViewController(animated: Bool) -> UIViewController? {
        let popVc: UIViewController! = super.popViewController(animated: animated)
        
        self.screenShotsDict .removeObject(forKey: self.pointer(object: self.topViewController)!)
        
        return popVc
    }
    
    // pop 到指定页面后，移除当前界面截屏及被跳过的界面截屏
    override func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {
        let popVcArray: [UIViewController] = super.popToViewController(viewController, animated: animated)!
        
        for vc: UIViewController? in popVcArray {
            self.screenShotsDict.removeObject(forKey: self.pointer(object: vc)!)
        }
        
        self.screenShotsDict.removeObject(forKey: self.pointer(object: self.topViewController)!)
        
        return popVcArray
    }
    
    // pop 到根视图界面后，移除这一系列的界面截屏
    override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        let popVcArray: [UIViewController] = super.popToRootViewController(animated: animated)!
        
        for vc: UIViewController? in popVcArray {
            self.screenShotsDict.removeObject(forKey: self.pointer(object: vc)!)
        }
        
        self.screenShotsDict.removeObject(forKey: self.pointer(object: self.topViewController)!)
        
        return popVcArray
    }
    
    // 重置界面的截屏（新增了界面会缺失截屏）
    override func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
        if viewControllers.contains(self.topViewController!) {
            self.screenShotsDict.setObject(self.capture()!, forKey: self.pointer(object: self.topViewController)! as NSCopying)
        }
        
        super.setViewControllers(viewControllers, animated: animated)
        
        let newDic: NSMutableDictionary! = NSMutableDictionary.init()
        
        for vc: UIViewController? in viewControllers {
            let obj: Any! = self.screenShotsDict.object(forKey: self.pointer(object: vc)!)
            
            if obj != nil {
                newDic.setObject(obj!, forKey: self.pointer(object: vc)! as NSCopying)
            }
        }
        
        self.screenShotsDict = newDic
    }
    
    
    // MARK: - 拖拽移动界面
    func shouldMoveWith(window: UIWindow!) -> Bool {
        // UIRemoteKeyboardWindow || UITextEffectsWindow
        let windowName: String! = NSStringFromClass(window.classForCoder)
        
        return ((windowName.count == 22) && windowName.hasPrefix("UI") && windowName.hasSuffix("RemoteKeyboardWindow")) || ((windowName.count == 19) && windowName.hasPrefix("UI") && windowName.hasSuffix("TextEffectsWindow"))
    }
    
    func moveViewWithX(x: Float) {
        // 设置水平位移在 [0, kScreenW] 之间
        let moveX: CGFloat = CGFloat(max(min(x, Float(kScreenW)), 0))
        
        // 设置 frame 的 x
        self.view.frame = CGRect(x: moveX, y: self.view.frame.origin.y, width: self.view.frame.size.width, height: self.view.frame.size.height)
        
        // 设置黑色蒙版的不透明度
        self.lastScreenBlackMask.alpha = 0.6 * (1 - (moveX / kScreenW))
        
        // 设置上一个截屏的缩放比例
        let scale: CGFloat = moveX / kScreenW * 0.05 + 0.95
        self.lastScreenShotView.transform = CGAffineTransform(scaleX: scale, y: scale)
        
        // 移动键盘
        if Int(UIDevice.current.systemVersion)! >= 9 {
            let array: NSArray = UIApplication.shared.windows as NSArray
            
            array.enumerateObjects { (object, index, stop) in
                if self.shouldMoveWith(window: (object as! UIWindow)) {
                    // 设置平移距离
                    (object as! UIWindow).transform = CGAffineTransform(translationX: moveX, y: 0)
                }
            }
        }
        else {
            if UIApplication.shared.windows.count > 1 {
                // 设置平移距离
                (UIApplication.shared.windows[1]).transform = CGAffineTransform(translationX: moveX, y: 0)
            }
        }
    }
    
    // 判断是否可以拖拽
    func enableDrag() -> Bool? {
        return (!self.disableDrag && self.viewControllers.count > 1)
    }
    
    // 拖拽状态转换为枚举状态
    @objc func paningGestureReceive(recoginzer: UIPanGestureRecognizer!) {
        if !self.enableDrag()! {
            return
        }
        
        if recoginzer.state == UIGestureRecognizer.State.began {
            if self.movingState == MovingStateEnumes.Stanby {
                self.movingState = MovingStateEnumes.Began
                self.backgroundView.isHidden = false
                self.lastScreenShotView.image = self.lastScreenShot()!
            }
        }
        else if recoginzer.state == UIGestureRecognizer.State.ended || recoginzer.state == UIGestureRecognizer.State.cancelled {
            if self.movingState == MovingStateEnumes.Began || self.movingState == MovingStateEnumes.Changed {
                self.movingState = MovingStateEnumes.End
                self.panGestureRecognizerDidFinish(panGestureRecognizer: recoginzer)
            }
        }
        else if recoginzer.state == UIGestureRecognizer.State.changed {
            if self.movingState == MovingStateEnumes.Began || self.movingState == MovingStateEnumes.Changed {
                self.movingState = MovingStateEnumes.Changed
                self.moveViewWithX(x: Float(recoginzer.translation(in: kWindow).x))
            }
        }
    }
    
    //
    func panGestureRecognizerDidFinish(panGestureRecognizer: UIPanGestureRecognizer!) {
        let decelerationTime: Float = 0.4
        
        // 获取手指离开时的速率
        let velocityX: CGFloat! = panGestureRecognizer.velocity(in: kWindow).x
        
        // 手指拖拽的距离
        let translationX: CGFloat! = panGestureRecognizer.translation(in: kWindow).x
        
        // 按照一定 decelerationTime 的衰减时间，计算出来的目标位置
        let targetX: CGFloat! = min(max(translationX + (velocityX * CGFloat(decelerationTime) / 2), 0), kScreenW)
        
        // 是否 pop
        let pop: Bool! = (targetX > MinX)
        
        // 设置动画初始化速率为当前手指离开的速率
        let initialSpringVelocity: CGFloat! = abs(velocityX) / (pop ? kScreenW - translationX : translationX)
        
        self.movingState = MovingStateEnumes.Decelerating
        
        let frame: CGRect! = CGRect(x: 0, y: self.view.frame.origin.y, width: self.view.frame.size.width, height: self.view.frame.size.height)
        
        var adjustTabbarFrame: Bool? = false
        
        if self.tabBarController != nil {
            if frame.equalTo(self.tabBarController!.view.frame) {
                adjustTabbarFrame = true
            }
            
            var superView: UIView! = self.view
            
            while superView != self.tabBarController!.view && superView != nil {
                if !frame.equalTo(self.tabBarController!.view.frame) {
                    adjustTabbarFrame = false
                    break
                }
                
                superView = superView.superview
            }
        }
        
        UIView.animate(withDuration: TimeInterval(AnimationDuration), delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: initialSpringVelocity, options: .curveEaseOut, animations: {
            self.moveViewWithX(x: Float(pop ? kScreenW : 0))
        }) { finished in
            self.backgroundView.isHidden = true
            
            if pop {
                let _ = self.popViewController(animated: false)
            }
            
            self.view.frame = frame
            
            if adjustTabbarFrame != nil {
                var superView: UIView! = self.view
                
                while superView != self.tabBarController!.view && (superView != nil) {
                    superView.frame = frame
                    
                    superView = superView.superview
                }
            }
            
            self.movingState = MovingStateEnumes.Stanby
            
            DispatchQueue.main.asyncAfter(deadline: .now() + ((pop ? 0.3 : 0) * Double(NSEC_PER_SEC))) {
                // 移动键盘
                if Int(UIDevice.current.systemVersion)! >= 9 {
                    let array: NSArray = UIApplication.shared.windows as NSArray
                    
                    array.enumerateObjects { (object, index, stop) in
                        if self.shouldMoveWith(window: (object as! UIWindow)) {
                            // 设置平移距离
                            (object as! UIWindow).transform = CGAffineTransform.identity
                        }
                    }
                }
                else {
                    if UIApplication.shared.windows.count > 1 {
                        // 设置平移距离
                        (UIApplication.shared.windows[1]).transform = CGAffineTransform.identity
                    }
                }
            }
        }
    }
    
    
    // MARK: - 拖拽手势处理
    // 不响应的手势则传递下去
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        // 手势落点在屏幕右边 1/3，不响应手势
        if touch.location(in: nil).x >= (kScreenW * 2 / 3) {
            return false
        }
        
        return self.enableDrag()!
    }
    
    // 适配 cell 左滑删除
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        let ges: UIPanGestureRecognizer! = otherGestureRecognizer as? UIPanGestureRecognizer

        let contentW: CGFloat! = max((((ges.view) as? UIScrollView)?.contentSize.width)!, 0)

        let compare: Bool! = contentW > (CGFloat((ges.view?.bounds.size.width)!) * CGFloat(1.5))


        // 手势是 UIScrollviewPan 且可以左右滑动，已经滑到最最左端
        if ges.isKind(of: NSClassFromString("UIScrollViewPanGestureRecognizer")!) {
            return (ges.view?.isKind(of: UIScrollView.classForCoder()))! && compare && (((ges.view) as? UIScrollView)?.contentOffset.x == 0)
        }

        // 手势不是 UIPanGestureRecognizer
        if !ges.isKind(of: UIPanGestureRecognizer.classForCoder()) {
            return false
        }

        // 手势落点在屏幕左边 1/3
        if ges.location(in: nil).x <= kScreenW / 3 {
            return false
        }

        // 手势是上下滑动
        let offset = ges.translation(in: nil)

        if abs(offset.x) <= abs(offset.y) {
            return false
        }

        // 手势是右滑
        if offset.x >= 0 {
            return false
        }
        
        // 确认是左滑了
        return true
    }
    

    // MARK: - Lazy Load 懒加载
    // 存放截屏的字典数组 key：控制器指针字符串 value：截屏图片
    lazy var screenShotsDict: NSMutableDictionary = {
        () -> NSMutableDictionary in
        return [:]
    }()
    
    // 显示上一个界面的截屏黑色背景
    lazy var backgroundView: UIView = {
        let backgroundView = UIView(frame: self.view.bounds)
        backgroundView.backgroundColor = .black
        
        self.lastScreenShotView = UIImageView(frame: backgroundView.bounds)
        self.lastScreenShotView.backgroundColor = .white
        backgroundView.addSubview(self.lastScreenShotView)
        
        self.lastScreenBlackMask = UIView(frame: backgroundView.bounds)
        self.lastScreenBlackMask.backgroundColor = .black
        backgroundView.addSubview(self.lastScreenBlackMask)
        
        if backgroundView.superview == nil {
            self.view.superview?.insertSubview(backgroundView, belowSubview: self.view)
        }
        
        return backgroundView
    }()
}
