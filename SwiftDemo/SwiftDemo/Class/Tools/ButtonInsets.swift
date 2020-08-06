// 快速创建使用 title 的 button 和设置 button 中图片与文字的样式
import UIKit

extension UIButton {
    // 设置 button 中图片与文字的样式（已图片为基准）
    enum InsetStyle {
        case Left
        case Right
        case Top
        case Bottom
        case Fill
    }
    
    // MARK: - 设置 button 中图片与文字的样式
    func buttonInsetStyle(InsetStyle: InsetStyle, space: CGFloat) {
        switch InsetStyle {
        case .Top:
            
            break
        case .Left:
            
            break
        case .Bottom:
            
            break
        case .Right:
            
            break
        case .Fill:
            
            break
        }
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
