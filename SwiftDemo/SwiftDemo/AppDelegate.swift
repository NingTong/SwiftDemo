
import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //初始化window
        initWindow()
        //初始化app服务
        initService()
        //网络监听
        monitorNetworkStatus()
        
        return true
    }
}

