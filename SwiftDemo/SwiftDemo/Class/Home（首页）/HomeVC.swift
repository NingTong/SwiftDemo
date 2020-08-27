//
//  HomeVC.swift
//  SwiftDemo
//
//  Created by admin on 2020/08/05.
//  Copyright © 2020 tn. All rights reserved.
//  首页

import UIKit

class HomeVC: BaseVC, HideNavigationBarProtocol {
    var btn = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        let button: UIButton! = UIButton.cButtonTitle(title: "next", font: sFont(18), titleColor: .white)
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        self.view.addSubview(button)
        button.addTarget(self, action: #selector(tapped(sender:)), for: .touchUpInside)
        btn = button
    }
    
    @objc func tapped(sender: UIButton) {
//        self.navigationController?.pushViewController(NextVC.init(), animated: true)
        UserSingleton.shared.loadUserInfo()
    }
}
