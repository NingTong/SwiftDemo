//
//  MineCell.swift
//  SwiftDemo
//
//  Created by admin on 2020/08/18.
//  Copyright © 2020 tn. All rights reserved.
//  我的 cell

import UIKit

class MineCell: UITableViewCell {
    
    @IBOutlet var leftImageView: UIImageView!               // 左侧图标
    
    @IBOutlet var titleLabel: UILabel!                      // 左侧标题
    
    @IBOutlet var detailsLabel: UILabel!                    // 右侧文字
    @IBOutlet var detailsLabelRight: NSLayoutConstraint!    // 右侧文字距离右边缘距离 默认 56  隐藏右侧箭头时为36
    
    @IBOutlet var arrawImageView: UIImageView!              // 右侧箭头图标
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
