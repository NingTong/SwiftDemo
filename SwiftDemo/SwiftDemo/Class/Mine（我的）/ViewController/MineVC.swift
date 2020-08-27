//
//  MineVC.swift
//  SwiftDemo
//
//  Created by admin on 2020/08/05.
//  Copyright © 2020 tn. All rights reserved.
//  我的

import UIKit

class MineVC: BaseVC {
    lazy var viewModel = MineViewModel()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: kScreenW, height: kScreenH - TabbarHeight - NavHeight), style: .plain)
        tableView.backgroundColor = kBaseColor
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "MineCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.rowHeight = 58
        // 头部 view
        let headerView = MineHeaderView.init(frame: CGRect(x: 0, y: 0, width: kScreenW, height: 148 + (kScreenW - 40)/(752/216) + 10))
        tableView.tableHeaderView = headerView
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = ""
        
        // UI 初始化
        setupSubViews()
        
        // 绑定数据源
        bindViewModel()
        
        // 点击 cell 触发
        tableView.rx.itemSelected.subscribe(onNext: { (indexPath) in
            switch indexPath.row {
            case 0:
            self.navigationController?.pushViewController(SwitchAccountVC.init(), animated: true)
            case 1:
            print(message: UserSingleton.shared.userInfo)
            default : break
            }
        }).disposed(by: disposeBag)
    }
    
    // UI 初始化
    func setupSubViews() {
        // 添加导航栏右侧按钮
        let rightButton = UIButton()
        rightButton.setImage(UIImage(named: "mine_msgBtn"), for: .normal)
        self.setRightItem(view: rightButton)
        rightButton.rx.tap.subscribe(onNext: { _ in
            // 跳转到系统消息
            self.navigationController?.pushViewController(ManagementAccountVC.init(), animated: true)
        }).disposed(by: disposeBag)
        
        // 添加 tableView
        view.addSubview(tableView)
    }
    
    // 绑定数据源
    func bindViewModel() -> Void {
        viewModel.data.bind(to: tableView.rx.items(cellIdentifier: "cell", cellType: MineCell.self)) {
            (row, model, cell) in
            cell.backgroundColor = kBaseColor
            cell.selectionStyle = .none
            
            // 左侧标题
            cell.titleLabel?.text = model.text
            
            // 右侧文字
            cell.detailsLabel?.text = model.detailsText
            cell.detailsLabelRight.constant = model.access ? 56 : 36
            
            // 左侧图标
            cell.leftImageView?.image = UIImage.init(named: model.imageName)
            
            // 右侧箭头图标
            cell.arrawImageView.isHidden = !model.access
        }.disposed(by: disposeBag)
    }
}
