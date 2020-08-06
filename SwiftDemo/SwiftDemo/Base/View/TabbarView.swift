
import UIKit

class TabbarView: UIView {
    // 数据源
    var datas: NSArray?
    
    // 按钮数组
    var buttons: NSMutableArray?
    
    // 选中的 item
    var selectItem = 0
    
    // 默认创建方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        buttons = NSMutableArray.init()
        datas = NSArray.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 初始化控件
    func viewLoad() {
        if datas!.count > 0 {
            // for 循环创建 buttons
            for i in 0..<datas!.count {
                let dic: NSDictionary = datas?[i] as! NSDictionary
                
                // 设置 button 的宽高
                let width: CGFloat = kScreenW/CGFloat(datas!.count)
                let height: CGFloat = kIphoneX ? (49 + 14) : 49
                
                // 创建 button
                let btn = UIButton.cButtonTitle(title: dic["title"] as! String, font: sFont(kIphoneX ? 12 : 10), titleColor: .white)
                btn.frame = CGRect(x: width*CGFloat(i), y: 3, width: width, height: height)
                btn.setTitleColor(rgba(249, 196, 70, 1), for: .selected)
                btn.setImage(UIImage.init(named: dic["imageName"] as! String), for: .normal)
                btn.setImage(UIImage.init(named: dic["selectImageName"] as! String), for: .selected)
                btn.buttonInsetStyle(InsetStyle: .Top, space: kIphoneX ? 12 : 8)
                self.addSubview(btn)
                buttons?.add(btn)
                
                if i == 0 {
                    btn.isSelected = true
                    selectItem = 0
                }
            }
        }
    }
    
    func selectwithInteger(integer: Int) {
        let selectBtn: UIButton = buttons![integer] as! UIButton
        
        let lastBtn: UIButton = buttons![selectItem] as! UIButton
        
        self.selectAnimation(button: selectBtn , scale: 0.8)
        
        if integer == selectItem {
            // 触发点击 item 的操作
            print(message: String(format: "%d", integer))
        }
        else {
            selectBtn.isSelected = true
            
            lastBtn.isSelected = false
        }
        
        selectItem = integer
    }
    
    func selectAnimation(button: UIButton, scale: CGFloat) {
        UIView.animate(withDuration: 0.2, animations: {
            button.layer.transform = CATransform3DMakeScale(scale, scale, 1)
        }) { finished in
            UIView.animate(withDuration: 0.2) {
                button.layer.transform = CATransform3DMakeScale(1, 1, 1)
            }
        }
    }
}
