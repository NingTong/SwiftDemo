
import Alamofire
import Foundation
import SwiftyJSON
import Moya

/// 超时时长
private var requestTimeOut: Double = 30

/// 成功数据的回调
typealias success = ((String) -> Void)

/// 失败的回调
typealias failure = ((String) -> Void)

/// 网络错误的回调
typealias errors = (() -> Void)

/// 网络请求的基本设置,这里可以拿到是具体的哪个网络请求，可以在这里做一些设置
private let endpointClosure = { (target: API) -> Endpoint in
    var endpoint = Endpoint(
        url: target.baseURL.absoluteString + target.path,
        sampleResponseClosure: { .networkResponse(200, target.sampleData) },
        method: target.method,
        task: target.task,
        httpHeaderFields: target.headers
    )
    return endpoint
}


/// 网络请求的设置
private let requestClosure = { (endpoint: Endpoint, done: MoyaProvider.RequestResultClosure) in
    do {
        var request = try endpoint.urlRequest()
        // 设置请求时长
        request.timeoutInterval = requestTimeOut
        // 打印请求参数
        if let requestData = request.httpBody {
            print(message: "\(request.url!)" + "\n" + "\(request.httpMethod ?? "")" + "发送参数" + "\(String(data: request.httpBody!, encoding: String.Encoding.utf8) ?? "")")
        } else {
            print(message: "url:" + "\(request.url!)" + " 请求方式:"  + "\(String(describing: request.httpMethod))")
        }
        done(.success(request))
    } catch {
        done(.failure(MoyaError.underlying(error, nil)))
    }
}

/// NetworkActivityPlugin插件用来监听网络请求，界面上做相应的展示
/// 但这里我没怎么用这个。。。 loading的逻辑直接放在网络处理里面了
private let networkPlugin = NetworkActivityPlugin.init { changeType, _ in
}

/// /网络请求发送的核心初始化方法，创建网络请求对象
let Provider = MoyaProvider<API>(endpointClosure: endpointClosure, requestClosure: requestClosure, plugins: [networkPlugin], trackInflights: false)

///  需要知道成功、失败、错误情况回调的网络请求   像结束下拉刷新各种情况都要判断
///
/// - Parameters:
///   - target: 网络请求
///   - completion: 成功
///   - failed: 失败
///   - error: 错误
@discardableResult // 当我们需要主动取消网络请求的时候可以用返回值Cancellable, 一般不用的话做忽略处理
func NetWorkRequest(_ target: API, completion: @escaping success, failed: failure?, errorResult: errors?) -> Cancellable? {
    // 先判断网络是否有链接 没有的话直接返回--代码略
    if !UIDevice.isNetworkConnect {
        print(message: "提示用户网络似乎出现了问题")
        return nil
    }
    return Provider.request(target) { result in
        // 隐藏hud
        ProgressHUD.dismissHUD()
        switch result {
        case let .success(response):
            do {
                let jsonData = try JSON(data: response.data)
                print(message: jsonData)

                if jsonData[Request_Code].stringValue == "1"{
                    completion(String(data: response.data, encoding: String.Encoding.utf8)!)
                }
                else {
                    failed?(String(data: response.data, encoding: String.Encoding.utf8)!)

                    print(message: "flag不为1 HUD显示后台返回message" + "\(jsonData[Request_Message].stringValue)")
                }

            } catch {}
        case let .failure(error):
            // 网络连接失败，提示用户
            print(message: "网络连接失败\(error)")
            errorResult?()
        }
    }
}

/// 基于Alamofire,网络是否连接，，这个方法不建议放到这个类中,可以放在全局的工具类中判断网络链接情况
/// 用计算型属性是因为这样才会在获取isNetworkConnect时实时判断网络链接请求，如有更好的方法可以fork
extension UIDevice {
    static var isNetworkConnect: Bool {
        let network = NetworkReachabilityManager()
        return network?.isReachable ?? true // 无返回就默认网络已连接
    }
}
