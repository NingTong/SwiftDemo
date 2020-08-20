
import UIKit

class RootTabBarVC: UITabBarController, UITabBarControllerDelegate {
    var tabBarView: TabbarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 基本设置
        self.delegate = self
        self.tabBar.backgroundColor = kBaseColor
        
        // tabbar 的设置
        setTabBar()
        
        // 添加子控制器
        addTabBarView()
    }
    
    // MARK: - tabbar 的设置
    func setTabBar() {
        // 去掉黑线
        self.tabBar.shadowImage = UIImage.init()
        self.tabBar.backgroundImage = UIImage.init()
        // 阴影设置
        let path = CGMutablePath()
        path.addRect(self.tabBar.bounds)
        self.tabBar.layer.shadowPath = path
        path.closeSubpath()
        
        self.tabBar.layer.shadowColor = UIColor.black.cgColor
        self.tabBar.layer.shadowOffset = CGSize.init(width: 0, height: -0.5)
        self.tabBar.layer.shadowRadius = 4
        self.tabBar.layer.shadowOpacity = 0.4
        self.tabBar.clipsToBounds = false
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
            
            // 从Info.plist中获取bundle的名字
            let namespace = Bundle.main.infoDictionary!["CFBundleName"] as! String
            
            // 0.将控制器的字符串转成控制器类型
            let classFromStr: AnyClass? = NSClassFromString(namespace + "." + (dic["vc"] as! String))
            
            let viewControllerClass = classFromStr as! UIViewController.Type
            
            // 1.创建控制器对象
            let viewController = viewControllerClass.init()
            
            self.setUpChildViewController(vc: viewController, title: (dic["title"] as! String))
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
        tabBarView.selectwithInteger(integer: tabBarController.selectedIndex)
    }
}



