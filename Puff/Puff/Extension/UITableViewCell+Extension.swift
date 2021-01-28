//
//  UITableViewCell+Extension.swift
//  Puff
//
//  Created by Max Kai on 2021/1/25.
//

import UIKit

extension UITableViewCell {
    
    static var identifier: String {
        
        return String(describing: self)
    }
    
    static var nibName: String {
        
        return String(describing: self)
    }
}
