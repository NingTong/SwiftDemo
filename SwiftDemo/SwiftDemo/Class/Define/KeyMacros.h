//标识符配置 减少因为打字错误带来的bug及修改整个程序的文字方便性
#ifndef KeyMacros_h
#define KeyMacros_h

//第三方密钥
#define buglyKey @""
#define DX_APPID @"95c59f39c9426ea0acde8f6024e82bc2"

//提示用语
#define prompt_Wait                 @"请稍候..."
#define prompt_NetworkPoor          @"似乎已断开与互联网的连接"
#define prompt_Network_failed       @"网络连接失败，请检查网络"
#define prompt_Server_timeout       @"访问服务器超时，请检查网络"
#define prompt_Server_error         @"服务器报错了，请稍后再访问"
#define prompt_Un_connect_server    @"无法连接服务器"
#define prompt_Token_failure        @"token 失效"

// 接口关键 Key
#define request_code                @"code"             // 根据这个 key 的数值 来确定请求是否成功
#define request_data                @"data"             // 请求成功返回的 data
#define request_msg                 @"msg"              // 请求成功后返回的 message
#define request_success_code        1                   // 这是请求成功的 code 的值

// userDefault Key 集合
#define userID                      @"userID"           // 当前用户的 ID
#define is_login                    @"isLogin"          // 是否已登录
#define app_version                 @"appVersion"       // 本地存储的版本号
#define app_id                      @"appId"            // DX 验证 appid key
#define DX_language                 @"language"         // DX 验证 多语言 key

// YYCache
#define user_cache                  @"userCache"        // 用户信息存储
#define user_array                  @"userArray"        // 用户信息数组

#endif
