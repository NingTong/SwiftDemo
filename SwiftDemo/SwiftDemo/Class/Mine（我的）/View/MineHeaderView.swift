//
//  MineHeaderView.swift
//  SwiftDemo
//
//  Created by admin on 2020/08/25.
//  Copyright © 2020 tn. All rights reserved.
//

import UIKit

class MineHeaderView: UIView {
    lazy var disposeBag = DisposeBag()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 个人信息 view
        self.loadUserView()
        
        // 分享 view
        self.loadShareView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - 个人信息 view
extension MineHeaderView {
    func loadUserView() {
        let view = UIView()
        self.addSubview(view)
        view.snp.makeConstraints { (make) in
            // 顶部
            make.top.equalTo(self)
            // 居中
            make.centerX.equalToSuperview()
            // 宽
            make.width.equalTo(kScreenW - 40)
            // 宽高比
            make.height.equalTo(148)
        }
        
        // 渐变色
        view.backgroundColor = UIColor.gradientColor(size: CGSize(width: kScreenW - 40, height: 148), colors: [rgba(31, 85, 191, 0.1).cgColor, rgba(113, 133, 199, 0.1).cgColor], type: .DirectionLevel)
        
        // 圆角和边框
        ViewBorderRadius(view: view, radius: 8, width: 2, color: rgba(171, 225, 253, 0.2))
    }
}

// MARK: - 分享 view
extension MineHeaderView {
    func loadShareView() {
        let view = UIView()
        self.addSubview(view)
        view.snp.makeConstraints { (make) in
            // 顶部
            make.top.equalToSuperview().offset(158)
            // 居中
            make.centerX.equalToSuperview()
            // 宽
            make.width.equalTo(kScreenW - 40)
            // 宽高比
            make.height.equalTo(view.snp.width).dividedBy(752/216)
        }
        
        // 背景图
        let imageView = UIImageView.init(image: UIImage.init(named: "分享好友"))
        view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.edges.equalTo(view).inset(UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0))
        }
        
        // Sports
        let sportsLabel = UILabel.cLabel(text: "SPORTS", font: UIFont(name: "Avenir-Heavy", size: 18)!, textColor: .white)
        view.addSubview(sportsLabel)
        sportsLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(12)
            make.centerY.equalToSuperview().offset(-8)
            make.width.equalTo(80)
            make.height.equalTo(22)
        }
        
        // 让运动更有价值
        let tipLabel = UILabel.cLabel(text: "让运动更有价值", font: .systemFont(ofSize: 12), textColor: .white)
        view.addSubview(tipLabel)
        tipLabel.snp.makeConstraints { (make) in
            make.left.equalTo(sportsLabel)
            make.top.equalTo(sportsLabel.snp.bottom).offset(2)
            make.width.equalTo(100)
            make.height.equalTo(15)
        }
        
        // 分享给好友
        let shareButton = UIButton.cButtonTitle(title: "分享给好友", font: UIFont(name: "Avenir-Heavy", size: 14)!, titleColor: rgba(241, 171, 7, 1))
        shareButton.setImage(UIImage(named: "右箭头-白色"), for: .normal)
        view.addSubview(shareButton)
        // 计算按钮宽度
        let buttonW = textW(text: shareButton.titleLabel?.text, font: shareButton.titleLabel?.font)
        shareButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-12)
            make.width.equalTo(buttonW + 20)
            make.height.equalTo(20)
        }
        shareButton.buttonInsetStyle(InsetStyle: .Right, space: 8)
        print(message: shareButton.titleLabel?.font.pointSize)
    }
}

// MARK: - Action
extension MineHeaderView {
    
}
