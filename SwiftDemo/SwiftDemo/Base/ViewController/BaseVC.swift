
import UIKit

class BaseVC: UIViewController {
    // 状态栏文字颜色
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent    //  白色
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = kBaseColor
    }

}
