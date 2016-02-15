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
//        self.layer.borderWidth = 1.0
//        self.layer.masksToBounds = false
//        self.layer.cornerRadius = self.frame.size.width/2
//        self.clipsToBounds = true
        
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0)
        UIBezierPath(roundedRect: bounds, cornerRadius: bounds.size.height / 2.0).addClip()
        image?.drawInRect(bounds)
        image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    func setImageView(identifier:String, round:Bool = false) {
            let cache = (UIApplication.sharedApplication().delegate as? AppDelegate)?.cache
        
            if let img = cache?.objectForKey(identifier) as? UIImage {
                self.image = img
            } else {
                if let img = UIImage(named: identifier) {
                    self.image = img

                    if round {
                        roundImage()
                    }

                    if let image = image {
                        cache?.setObject(image, forKey: identifier)
                    }
                }
            }
    }
}
