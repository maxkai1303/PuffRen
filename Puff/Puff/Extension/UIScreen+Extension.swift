//
//  UIScreen+Extension.swift
//  Puff
//
//  Created by Max Kai on 2021/1/25.
//

import UIKit

extension UIScreen {
    
    static var height: CGFloat {
        
        return self.main.bounds.height
    }
    
    static var width: CGFloat {
        
        return self.main.bounds.width
    }
}
