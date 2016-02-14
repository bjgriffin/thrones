//
//  UIImageView+Ext.swift
//  thrones
//
//  Created by BJ Griffin on 2/14/16.
//  Copyright © 2016 BJ Griffin. All rights reserved.
//

import UIKit

extension UIImageView {

    func roundImage() {
        self.layer.borderWidth = 1.0
        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.frame.size.width/2
        self.clipsToBounds = true
    }
}
