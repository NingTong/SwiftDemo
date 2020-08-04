/// 包含第三方 和 应用内业务的实现，减轻入口代码压力
import SVProgressHUD

extension AppDelegate {
    
    // MARK: - 初始化服务
    func initService() {
        // SVProgressHUD 配置
        SVProgressHUD.setMinimumDismissTimeInterval(TimeInterval(CGFloat.greatestFiniteMagnitude))
        
        // 防止 button 重复点击
        UIButton.appearance().isExclusiveTouch = true
    }
    
    // MARK: - 初始化 window
    func initWindow() {
        // 设置根视图控制器
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = .white
        self.window?.rootViewController = ViewController.init()
        self.window?.makeKeyAndVisible()
    }
    
    // MARK: - 监听网络状态
    func monitorNetworkStatus() {
        
    }
    
    // MARK: - 单例
    class func share() -> AppDelegate? {
        return (UIApplication.shared.delegate as! AppDelegate)
    }
}
