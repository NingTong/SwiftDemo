
import UIKit

/**
渐变方式

- DirectionLevel:                                   水平渐变
- DirectionVertical:                                竖直渐变
- DirectionUpwardDiagonalLine:          向下对角线渐变
- DirectionDownDiagonalLine:             向上对角线渐变
*/
enum GradientDirection {
    case DirectionLevel
    case DirectionVertical
    case DirectionUpwardDiagonalLine
    case DirectionDownDiagonalLine
}

// MARK: - 渐变色
extension UIColor {
    static func gradientColor(size: CGSize, colors: [CGColor], type: GradientDirection) -> UIColor {
        // 判断参数是否有值
        if colors.count == 0 || size == CGSize.zero {
            return .clear
        }
        
        let gradient: CAGradientLayer = CAGradientLayer();
        //设置开始和结束位置(通过开始和结束位置来控制渐变的方向)
        gradient.startPoint = .zero
        switch type {
            case .DirectionLevel:
                gradient.endPoint = CGPoint(x: 1, y: 0)
            
            case .DirectionVertical:
                gradient.endPoint = CGPoint(x: 0, y: 1)
            
            case .DirectionUpwardDiagonalLine:
                gradient.endPoint = CGPoint(x: 1, y: 1)
            
            case .DirectionDownDiagonalLine:
                gradient.startPoint = CGPoint(x: 0, y: 1)
                gradient.endPoint = CGPoint(x: 1, y: 0)
        }
        gradient.colors = colors;
        gradient.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        
        UIGraphicsBeginImageContext(size)
        gradient.render(in: UIGraphicsGetCurrentContext()!)
        
        let image: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return UIColor.init(patternImage: image!)
    }
}
