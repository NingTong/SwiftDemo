//
//  MineModel.swift
//  SwiftDemo
//
//  Created by admin on 2020/08/18.
//  Copyright © 2020 tn. All rights reserved.
//

import UIKit

struct Mine {
    let text: String
    
    let detailsText: String
    
    let imageName: String
    
    let access: Bool
    
    init(text: String, detailsText: String, imageName: String, access: Bool) {
        self.text = text
        
        self.detailsText = detailsText
        
        self.imageName = imageName
        
        self.access = access
    }
}

extension Mine: CustomStringConvertible {
    var description: String {
        return "text: \(text), detailsText: \(detailsText), imageName: \(imageName), access: \(access)"
    }
}
