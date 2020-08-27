
import Foundation

import Moya

enum API {
    case user_info                                              // 用户信息
    
    case asset_get_asset(params: Dictionary<String, Any>)       // 用户资产
    
    case computing_machine_computing_machine_position_list      // 算力机位
}

extension API: TargetType {
    
    var baseURL: URL {
        return URL.init(string:(Request_BaseUrl))!
    }
    
    var path: String {
        switch self {
        case .user_info:
            return "/user/info"
            
        case .asset_get_asset:
            return "/asset/get_asset"
            
        case .computing_machine_computing_machine_position_list:
            return "/computing/machine/computing_machine_position_list"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .user_info, .asset_get_asset, .computing_machine_computing_machine_position_list:
            return .get
        }
    }
    
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
        switch self {
        case .user_info, .computing_machine_computing_machine_position_list:
            return .requestPlain
        
        case let .asset_get_asset(params):
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        if path.contains("common") {
            return ["Content-Type" : "application/json"]
        }
        else {
            return ["Content-Type" : "application/json", "access_token" : "43fb14c3-0a8d-4e21-9e39-3dd61aea0846"]
        }
    }
}
