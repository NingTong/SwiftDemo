//
//  MineVC.swift
//  SwiftDemo
//
//  Created by admin on 2020/08/05.
//  Copyright © 2020 tn. All rights reserved.
//  我的

import UIKit

import SnapKit

class MineVC: BaseVC, HideNavigationBarProtocol {
    lazy var viewModel = MineViewModel()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: self.view.bounds, style: .plain)
        tableView.backgroundColor = kBaseColor
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "MineCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.rowHeight = 58
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UI 初始化
        setupSubViews()
        
        // 绑定数据源
        bindViewModel()
        
        // 点击 cell 触发
        tableView.rx.itemSelected.subscribe(onNext: { (indexPath) in
            switch indexPath.row {
            case 0:
                self.navigationController?.pushViewController(SwitchAccountVC.init(), animated: true)
            case 1: break
                
            default : break
            }
        }).disposed(by: disposeBag)
    }
    
    // UI 初始化
    func setupSubViews() {
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
