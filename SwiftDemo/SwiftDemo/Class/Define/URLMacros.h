#ifndef URLMacros_h
#define URLMacros_h

/*
 配置服务器状态（开发、测试、生产）
 */

#define SeverStatus    0

/**开发服务器*/
#if SeverStatus == 0
#define URL_main @"http://192.168.123.83:20011"

/**测试服务器*/
#elif SeverStatus == 1
#define URL_main @"http://34.92.59.223"

/**生产服务器*/
#elif SeverStatus == 2
#define URL_main @"http://api.sports-chain.com"

#endif

#pragma mark - ——————— 后台回调code ————————
/**正确回调*/
#define rightCode      1
/**token过期*/
#define OutLoginCode  -4


#pragma mark - ———————————————————————————— 资产接口 —————————————————————————————
// 兑换
#define asset_exchange                      @"/asset/exchange"

// 获取个人资产
#define asset_get_asset                     @"/asset/get_asset"

// 获得资产记录 typesStr格式（300或300,301）
#define asset_get_asset_log                 @"/asset/get_asset/log"

// 获得资产记录超集 type(0全部 100可用记录 200冻结记录 300空投记录 400推荐奖励 500充币记录 600提币记录 700转币记录 800星球收益 900兑换记录 1000理财收益 1100步行奖励 1200划转记录)
#define asset_get_asset_log_super           @"/asset/get_asset/log/super"

// 获得资产统计数据
#define asset_get_asset_statistics          @"/asset/get_asset_statistics"

// 获得区块链交易详情
#define asset_get_block_tx                  @"/asset/get_block_tx"

// 获取币种类型
#define asset_get_currency                  @"/asset/get_currency"

// 获取行情
#define asset_get_currency_price            @"/asset/get_currency_price"

// 获取 C2C 冻结数量
#define asset_get_legal_left_amount         @"/asset/get_legal_left_amount"

// 领取收益
#define asset_get_profit                    @"/asset/get_profit"

// 划转记录
#define asset_get_transfer_log              @"/asset/get_transfer_log"

// 获取步数奖励
#define asset_get_walk_prize                @"/asset/get_walk_prize"

// 获取步行统计收益
#define asset_get_walk_prize_statistics     @"/asset/get_walk_prize_statistics"

//内部转账
#define asset_internal_transfer             @"/asset/internal_transfer"

//普通转账
#define asset_normal_transfer               @"/asset/normal_transfer"

//我的收益
#define asset_profit                        @"/asset/profit"

//划转
#define asset_transfer                      @"/asset/transfer"


#pragma mark - ———————————————————————————— 公告接口 —————————————————————————————
// 获得轮播图 (status 1上架0下架)(type类型：100首页，200竞猜，300生态轮播图)
#define banner_get_banner                   @"/banner/get_banner"

// 获得广播 (type 100系统消息 200活动消息，300竞猜广播，400生态广播，500投注广播) (status 1上架0下架)
#define banner_get_broadcast                @"/banner/get_broadcast"

// 获取帮助信息
#define banner_get_help_info                @"/banner/get_help_info"

// 获取资讯
#define banner_get_information              @"/banner/get_information"

// 获取客服
#define banner_get_robot                    @"/banner/get_robot"


#pragma mark - ———————————————————————————— 竞猜接口 —————————————————————————————
// 创建竞猜订单 type(100涨 200跌)
#define bet_create_bet_order                @"/bet/create_bet_order"

// 获得竞猜比赛记录 type 101比特币竞猜 102以太坊竞猜
#define bet_get_bet                         @"/bet/get_bet"

// 获取竞猜订单
#define bet_get_bet_order                   @"/bet/get_bet_order"

// 获得竞猜资金池 betType 101比特币竞猜 102以太坊竞猜
#define bet_get_bet_prize_pool              @"/bet/get_bet_prize_pool"

// 获得竞猜资产 status(100 投注进行 200停止投注 300结束)
#define bet_get_user_bet_asset              @"/bet/get_user_bet_asset"

// 获得竞猜资产记录
#define bet_get_user_bet_asset_log          @"/bet/get_user_bet_asset_log"



#pragma mark - ———————————————————————————— 公共接口 —————————————————————————————
// 忘记密码
#define common_change_password              @"/common/change_password"

// 获取下载页
#define common_get_download_page_url        @"/common/get_download_page_url"

// 获得手续费系数
#define common_get_exchange_fee_coe         @"/common/get_exchange_fee_coe"

// 获得邮箱白名单
#define common_get_legal_mail_list          @"/common/get_mail_white_list"

//获取服务器时间
#define common_get_server_time              @"/common/get_server_time"

// 根据key值获得全局配置
#define common_get_system_config            @"/common/get_system_config"

// 获得最新版本 model(100安卓200ios)
#define common_get_version                  @"/common/get_version"


// 发送邮件 (100注册 101修改手机号 102增加卡号 103改密码)
#define common_send_mail                    @"/common/send_mail"

// 发送短信 (100注册 101修改手机号 102增加卡号 103改密码 104登录验证 105改邮箱 106改安全密码)
#define common_send_sms                     @"/common/send_sms"

// 邮箱登录
#define common_sign_in_mail_pass            @"/common/sign_in_mail_pass"

// 邮箱登录验证
#define common_sign_in_mail_sms             @"/common/sign_in_mail_sms"

// 手机号登录
#define common_sign_in_phone_pass           @"/common/sign_in_phone_pass"

// 手机号登录验证
#define common_sign_in_phone_sms            @"/common/sign_in_phone_sms"

// 邮箱注册
#define common_sign_up_mail_pass            @"/common/sign_up_mail_pass"

// 手机号注册
#define common_sign_up_phone_pass           @"/common/sign_up_phone_pass"


#pragma mark - ———————————————————————————— 动态接口 —————————————————————————————
// 伞下业绩
#define dynamic_get_buy_static_log          @"/dynamic/get_buy_static/log"

// 获得直推领导(领导等级大于等于自己)的个数 自己等级为0则为团队业绩是否满足60000 满足返回2
#define dynamic_get_refer_gt_eq_leader_num  @"/dynamic/get_refer_gt_eq_leader_num"

// 获得团队列表 floor从0开始 例 第一代 floor为0 paid 1有买配套 0没买配套
#define dynamic_get_team                    @"/dynamic/get_team"

// 获得团队列表统计
#define dynamic_get_team_statistics         @"/dynamic/get_team_statistics"

// 获得入收益池记录 静态101 推荐102 团队103 社区104 平级奖励105 201领取收益 冻结静态401 冻结推荐402 冻结团队403 冻结社区404 冻结平级奖励405
#define dynamic_get_user_profit_pool_log    @"/dynamic/get_user_profit_pool/log"

// 升级领导等级
#define dynamic_update_leader_level         @"/dynamic/update_leader_level"


#pragma mark - ———————————————————————————— 法币接口 —————————————————————————————
// 取消交易订单
#define legal_cancel                        @"/legal/cancel"

// 取消挂（买/卖）订单
#define legal_cancel_order                  @"/legal/cancel_order"

// 确认支付
#define legal_confirm_pay                   @"/legal/confirm_pay"

// 确认收款
#define legal_confirm_receipt               @"/legal/confirm_receipt"

// 创建挂买/卖订单
#define legal_create_order                  @"/legal/create_order"

// 创建交易订单
#define legal_create_order_trade            @"/legal/create_order_trade"

// 创建订单并交易
#define legal_create_order_trade_and_pay    @"/legal/create_order_trade_and_pay"

// 反馈
#define legal_feedback                      @"/legal/feedback"

// 一键买买卖币查询 type 100我要买 200 我要卖
#define legal_fast_find_order               @"/legal/fast_find_order"

// 获得法币订单 type(100买 200卖) status(100未完成 200交易完成 )
#define legal_get_legal_order               @"/legal/get_legal_order"

// 获得法币交易订单 type(100买 200卖) status (100待付款 200待放币 300交易结束 400反馈 500已取消 600待付款超时 700待放币超时)
#define legal_get_legal_order_trade         @"/legal/get_legal_order/trade"

// 内部支付
#define legal_internal_pay                  @"/legal/internal_pay"


#pragma mark - ———————————————————————————— 消息接口 —————————————————————————————
// 批量删除消息
#define message_batch_delete_message        @"/message/batch_delete_message"

// 批量已读消息
#define message_batch_read_message          @"/message/batch_read_message"

// 一键已读
#define message_batch_update_message        @"/message/batch_update_message"

// 获取消息中心 (一级列表)
#define message_get_message_center          @"/message/get_message_center"

// 获取消息列表 （二级列表）
#define message_get_title_list              @"/message/get_title_list"

// 获取消息详情列表 （三级列表）
#define message_get_message_detail          @"/message/get_message_detail"

// 获取未读消息数
#define message_get_message_unread_count    @"/message/get_message_unread_count"


#pragma mark - ———————————————————————————— 静态接口 ——————————————————————————————
// 买入资产
#define static_buy_static                   @"/static/buy_static"

// 查看个人投资资产
#define static_get_static_asset             @"/static/get_static_asset"

// 查看投资理财统计数据
#define static_get_static_asset_statistics  @"/static/get_static_asset_statistics"

// 首页步数排行榜
#define static_get_top_walk_log_list        @"/static/get_top_walk_log_list"

// 共振复投
#define static_plus_static                  @"/static/plus_static"

//解约 取消资产
#define static_quit_static                  @"/static/quit_static"


#pragma mark - ———————————————————————————— 用户接口 —————————————————————————————
// 添加收款方式 payway(100微信 200支付宝 300银行卡 400paypal 500 usdt(internal)) verifyway 100手机号 200邮箱
#define user_add_pay_way                    @"/user/add_pay_way"

// 绑定邮箱
#define user_bind_mail                      @"/user/bind_mail"

// 绑定手机
#define user_bind_phone                     @"/user/bind_phone"

// 绑定安全密码
#define user_bind_safe_pass                 @"/user/bind_safe_pass"

// 修改头像 图片上传
#define user_change_head                    @"/user/change_head"

// 修改系统默认头像
#define user_change_head_default            @"/user/change_head_default"

// 修改昵称
#define user_change_name                    @"/user/change_name"

// 修改密码
#define user_change_password                @"/user/change_password"

// 检查安全密码
#define user_check_safe_password            @"/user/check_safe_password"

// 消除收款方式
#define user_del_pay_way                    @"/user/del_pay_way"

// 获取（充币）地址
#define user_get_addr                       @"/user/get_addr"

// 获得收款方式 payway(微信100 支付宝200 银行卡300) status(100未认证 200已认证 300驳回)
#define user_get_pay_way                    @"/user/get_pay_way"

// 获取配置
#define user_get_useless_config             @"/user/get_useless_config"

// 个人信息
#define user_info                           @"/user/info"

// 上传文件
#define user_upload_URL                     @"/user/upload"


#endif
