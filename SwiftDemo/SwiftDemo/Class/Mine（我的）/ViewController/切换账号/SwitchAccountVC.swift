//
//  SwitchAccountVC.swift
//  SwiftDemo
//
//  Created by admin on 2020/08/19.
//  Copyright © 2020 tn. All rights reserved.
//  切换账号

import UIKit

class SwitchAccountVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 初始化 UI
        self.setupSubViews()
    }
    
    // 初始化 UI
    func setupSubViews() {
        // 添加导航栏右侧按钮
        let rightButton = UIButton.cButtonTitle(title: "管理", font: sFont(14), titleColor: .white)
        
        rightButton.rx.tap.subscribe(onNext: { _ in
            // 跳转到账号管理
            self.navigationController?.pushViewController(ManagementAccountVC.init(), animated: true)
            }).disposed(by: disposeBag)
        
        self.setRightItem(view: rightButton)
    }
}
