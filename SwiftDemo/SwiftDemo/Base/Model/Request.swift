
import UIKit
import Foundation

// 请求方式: post、get、put、patch、delete
enum RequestMethod {
    case POST
    case GET
    case PUT
    case PATCH
    case DELETE
}

class Request: NSObject {
    // 初始化单例方法
    class func shareInstance() -> Self {
        var instance: Request? = nil
        var predicate = DISPATCH_ONCE_INLINE_FASTPATH
//        DISPATCH_ONCE_INLINE_FASTPATH(&predicate, ^{
//            if !instance {
//                instance = self.init()
//            }
//        })
        return instance as! Self
    }
}
