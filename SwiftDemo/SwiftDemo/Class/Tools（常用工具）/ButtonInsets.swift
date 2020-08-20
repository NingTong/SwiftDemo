// 快速创建使用 title 的 button 和设置 button 中图片与文字的样式
import UIKit

extension UIButton {
    // 设置 button 中图片与文字的样式（已图片为基准）
    enum InsetStyle {
        // 图片在左 文字在右
        case Left
        
        // 图片在右 文字在左
        case Right
        
        // 图片在上 文字在下
        case Top
        
        // 图片在下 文字在上
        case Bottom
        
        // 图片距离左边缘 文字距离右边缘
        case FillLeft
        
        // 图片距离右边缘 文字距离左边缘
        case FillRight
    }
    
    // MARK: - 设置 button 中图片与文字的样式
    func buttonInsetStyle(InsetStyle: InsetStyle, space: CGFloat) {
        // 获取 imageView 和 titleLabel 的宽高
        let imageW: CGFloat! = self.imageView?.frame.size.width
        
        let imageH: CGFloat! = self.imageView?.frame.size.height
        
        let labelW: CGFloat! = self.titleLabel?.frame.size.width
        
        let labelH: CGFloat! = self.titleLabel?.frame.size.height
        
        // 创建 imageEdgeInsets 和 labelEdgeInsets 的值
        var imageEdgeInsets: UIEdgeInsets! = .zero
        
        var labelEdgeInsets: UIEdgeInsets! = .zero
        
        // 根据排列样式和间距设置 imageEdgeInsets 和 labelEdgeInsets 的值
        switch InsetStyle {
        case .Top:
            imageEdgeInsets = UIEdgeInsets(top: -labelH - space/2.0, left: 0, bottom: 0, right: -labelW)
            
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageW, bottom: -imageH - space/2.0, right: 0)
            break
        case .Left:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: -space/2.0, bottom: 0, right: space/2.0)
        
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -space/2.0, bottom: 0, right: -space/2.0)
            break
        case .Bottom:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -labelH - space/2.0, right: -labelW)
            
            labelEdgeInsets = UIEdgeInsets(top: -imageH - space/2.0, left: -imageW, bottom: 0, right: 0)
            break
        case .Right:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: labelW + space/2.0, bottom: 0, right: -labelW - space/2.0)
            
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageW - space/2.0, bottom: 0, right: imageH + space/2.0)
            break
        case .FillLeft:
            let interval: CGFloat! = self.frame.size.width - imageW - titleLabel!.intrinsicContentSize.width - space*2
            
            imageEdgeInsets = UIEdgeInsets(top: 0, left: -interval/2.0, bottom: 0, right: interval/2.0)
            
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -interval/2.0, bottom: 0, right: -interval/2.0)
            break
        case .FillRight:
            let interval: CGFloat! = self.frame.size.width - imageW - titleLabel!.intrinsicContentSize.width - space*2
            
            imageEdgeInsets = UIEdgeInsets(top: 0, left: labelW + interval/2.0, bottom: 0, right: -labelW - interval/2.0)
            
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageW - interval/2.0, bottom: 0, right: imageH + interval/2.0)
            break
        }
        
        // 赋值
        self.imageEdgeInsets = imageEdgeInsets
        
        self.titleEdgeInsets = labelEdgeInsets
    }
    
    // MARK: - 快速创建 button
    static func cButtonTitle(title: String, font: UIFont, titleColor: UIColor) -> UIButton {
        let button = UIButton.init(type: .custom)
        
        button.setTitle(title, for: .normal)
        
        button.setTitleColor(titleColor, for: .normal)
        
        button.titleLabel?.font = font
        
        return button
    }
}
