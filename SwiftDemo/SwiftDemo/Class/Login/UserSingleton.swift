
import Foundation

public class UserSingleton {
    // 私有静态对象
    private static let sharedInstance = UserSingleton()
    
    // 私有初始化方法
    private init() {}
    
    // 提供公共静态访问方法
    public static var shared: UserSingleton {
        return self.sharedInstance
    }
    
    // 用户信息 model
    var userInfo: UserInfoModel.model? = nil}

// MARK: - 获取个人信息
extension UserSingleton {
    func loadUserInfo() {
        NetWorkRequest(.user_info, completion: { data in
            do {
                let decoder = CleanJSONDecoder()
                let model = (try decoder.decode(UserInfoModel.self, from: data)).data
                UserSingleton.shared.userInfo = model
            } catch {
                debugPrint(error)
            }
        }, failed: nil, errorResult: nil)
    }

}
