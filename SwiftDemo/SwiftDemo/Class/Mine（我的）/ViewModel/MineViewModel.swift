//
//  MineViewModel.swift
//  SwiftDemo
//
//  Created by admin on 2020/08/18.
//  Copyright © 2020 tn. All rights reserved.
//

import UIKit

import RxSwift

class MineViewModel: NSObject {
    let data = Observable.of([
        Mine(text: "切换账号", detailsText: "", imageName: "切换账号", access: true),
        
        Mine(text: "切换计价货币", detailsText: "", imageName: "切换计价货币", access: true),
        
        Mine(text: "账号安全", detailsText: "", imageName: "账号安全", access: true),
        
        Mine(text: "手机号", detailsText: "", imageName: "手机号", access: true),
        
        Mine(text: "邮箱", detailsText: "", imageName: "邮箱", access: true),
        
        Mine(text: "客服中心", detailsText: "", imageName: "客服", access: true),
        
        Mine(text: "关于我们", detailsText: "", imageName: "关于我们", access: true),
        
        Mine(text: "版本", detailsText: kAppVersion as! String, imageName: "版本", access: false)
    ])
}
