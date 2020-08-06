
import UIKit

class RootTabBarVC: UITabBarController, UITabBarControllerDelegate {
    var tabBarView: TabbarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        // 设置背景
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        
        // 添加子控制器
        self.addTabBarView()
    }
    
    // MARK: - 添加自定义 tabbar
    func addTabBarView() {
        // 获取 plist 里的控制器信息
        let filePath: String! = Bundle.main.path(forResource: "TabBarChildVC", ofType: "plist");
        
        // 设置自定义 tabbar 的内容
        tabBarView = TabbarView.init(frame: CGRect(x: 0, y: 0, width: kScreenW, height: TabbarHeight))
        
        tabBarView.backgroundColor = kBaseColor
        
        tabBarView.datas = NSArray.init(contentsOfFile: filePath)
        
        tabBarView.viewLoad()
        
        // 添加到系统的 tabbar 中
        self.tabBar.insertSubview(tabBarView, at: 0)
        
        // for 循环添加子控制器
        for i in 0..<tabBarView.datas!.count {
            let dic:NSDictionary! = (tabBarView.datas![i] as! NSDictionary)
            
            let vcClass: AnyClass! = NSClassFromString(dic["vc"] as! String)
            
            let vc: UIViewController! = (vcClass.init() as! UIViewController)
            
            self.setUpChildViewController(vc: vc, title: (dic["title"] as! String))
        }
    }
    
    // MARK: - 添加子控制器
    func setUpChildViewController(vc: UIViewController!, title: String!) {
        let navVC: RootNavigationVC! = RootNavigationVC.init(rootViewController: vc)
        
        vc?.navigationItem.title = title
        
        self.addChild(navVC)
    }
    
    // MARK: - UITabBarControllerDelegate
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        tabBarView .selectwithInteger(integer: tabBarController.selectedIndex)
    }
}



