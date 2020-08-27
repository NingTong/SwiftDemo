
import UIKit

extension UILabel {
    // MARK: - 快速创建 button
    static func cLabel(text: String, font: UIFont, textColor: UIColor) -> UILabel {
        let label = UILabel()
        
        label.text = text
        
        label.textColor = textColor
        
        label.font = font
        
        return label
    }
}

