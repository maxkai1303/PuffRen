//
//  UIView+Extension.swift
//  Puff
//
//  Created by Max Kai on 2021/1/25.
//

import UIKit

extension UIView {
    
    func setupShadow() {
        
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
        
        self.layer.shadowOpacity = 0.5
        
        self.layer.shadowRadius = 2
        
        self.layer.shadowColor = UIColor.darkGray.cgColor
    }
}
