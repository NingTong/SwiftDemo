
import UIKit

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
