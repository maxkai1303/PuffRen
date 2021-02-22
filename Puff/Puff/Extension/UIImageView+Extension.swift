//
//  UIImageView+Extension.swift
//  Puff
//
//  Created by Max Kai on 2021/1/28.
//

import UIKit

extension UIImageView {
    
    func addTapAction(sender: Any, actioon: Selector) {
        
        let tapGestureRecpgnozer = UITapGestureRecognizer(target: sender, action: actioon)
        
        self.isUserInteractionEnabled = true
        
        self.addGestureRecognizer(tapGestureRecpgnozer)
    }
}
