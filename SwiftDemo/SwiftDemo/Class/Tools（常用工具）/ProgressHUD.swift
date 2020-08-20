
import UIKit

import SVProgressHUD

enum ProgressHUDStatus {
    case success            /// 成功
    
    case error              /// 失败
    
    case info               /// 叹号提示
    
    case loading            /// 等待
    
    case progress           /// 过程
}

class ProgressHUD: NSObject {
    /// 带！图片的提示
    static func showInfoMsg(_ status: String?) {
         showWithStatus(type: .info, status: status)
     }
     
    ///错误 带X的图片
    static func showError(_ status: String?) {
    showWithStatus(type: .error, status: status)
    }
    
    ///带图片 成功
    static func showSuccess(_ status: String?) {
        showWithStatus(type: .success, status: status)
    }
    
    ///显示加载
    static func showLoading(_ status: String?) {
        showWithStatus(type: .loading, status: status)
    }
    
    ///显示进度
    static func showProgress(_ status: String?, progress: CGFloat) {
        showWithStatus(type: .progress, status: status, progress: progress)
    }

    static func dismissHUD() {
        SVProgressHUD.dismiss()
    }
    
    static func showWithStatus (type: ProgressHUDStatus, status: String?, progress: CGFloat = 0) {
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.light)
        switch type {
            case .success:
                SVProgressHUD.showSuccess(withStatus: status)
            
            case .error:
                SVProgressHUD.showError(withStatus: status)
            
            case .loading:
                SVProgressHUD.show(withStatus: status)
            
            case .info:
                SVProgressHUD.showInfo(withStatus: status)
            
            case .progress:
                SVProgressHUD.showProgress(Float(progress), status: status)
            }
    }
}
