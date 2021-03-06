//
//  UserInfoModel.swift
//  SwiftDemo
//
//  Created by admin on 2020/08/19.
//  Copyright © 2020 tn. All rights reserved.
//

import UIKit

struct UserInfoModel: Codable {
    let code: Int
    
    let data: model
    
    let msg: String
    
    struct model: Codable {
        // 传道大使等级 0-15
        let cdLevel: Int
        
        // vip标识 0没有 1已有
        let directFaceVerify: Int
        
        // AI认证 0未通过 1已通过 2审核中 2审核失败
        let faceVerify: Int
        
        // 火种计划 0未点亮 1已点亮
        let firePlanValide: Int
        
        // 矿工 0未购买 1已购买
        let hasNormal: Int
        
        // 节点 0未购买 1已购买
        let hasSuper: Int
        
        // 用户头像
        let headUrl: String
        
        // 用户 ID
        let id: Int
        
        // 上级邀请码
        let inviteCode: String
        
        // 上级邀请码地址
        let inviteUrl: String
        
        // 是否可以领取新人注册算力机奖励（0否，1是）
        let machineReward: Int
        
        // 邮箱
        let mail: String
        
        // 昵称
        let name: String
        
        // 是否有效 0是无效用户，1是有效用户
        let paid: Int
        
        // 手机号
        let phone: String
        
        // 环球天使等级 0-7
        let socialLevel: Int
        
        // 用户 DID
        let ulId: Int
        
        // 用户绑定的设备
        let userDeviceModel: String
    }
}
