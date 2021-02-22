//
//  UIView+Extension.swift
//  Puff
//
//  Created by Max Kai on 2021/1/25.
//

import UIKit

extension UIView {
    
    func cutRound() {
        
        self.clipsToBounds = true
        
        self.layer.cornerRadius = self.height / 2
    }
    
    // object identifier
    
    static var identifier: String {
        
        return String(describing: self)
    }
    
    static var nibName: String {
        
        return String(describing: self)
    }
    
    // size and position
    
    var x: CGFloat {
        
        get {
            
            return self.frame.origin.x
        }
        
        set {
            
            self.frame.origin.x = newValue
        }
    }
    
    var y: CGFloat {
        
        get {
            
            return self.frame.origin.y
        }
        
        set {
            
            self.frame.origin.y = newValue
        }
    }
    
    var height: CGFloat {
        
        get {
            
            return self.frame.size.height
        }
        
        set {
            
            self.frame.size.height = newValue
        }
    }
    
    var width: CGFloat {
    
        get {
            
            return self.frame.size.width
        }
        
        set {
            
            self.frame.size.width = newValue
        }
    }
    
    func setupShadow() {
        
        self.layer.shadowOffset = CGSize(width: 4, height: 4)

        self.layer.shadowOpacity = 0.5

        self.layer.shadowRadius = 2

        self.layer.shadowColor = UIColor.darkGray.cgColor
    }
    
    func setupBorder(width: CGFloat, color: UIColor) {
        
        self.layer.borderWidth = width
        
        self.layer.borderColor = color.cgColor
    }
}
