//
//  PFLabel.swift
//  Puff
//
//  Created by 唐紹桓 on 2021/2/5.
//

import UIKit

@IBDesignable
class PFLabel: UILabel {
    
    // MARK: - Label Padding
    
    var padding = UIEdgeInsets()
    
    @IBInspectable var topPadding: CGFloat = 0.0 {
        
        didSet {
            
            padding.top = topPadding
        }
    }
    
    @IBInspectable var leftPadding: CGFloat = 0.0 {
        
        didSet {
            
            padding.left = leftPadding
        }
    }
    
    @IBInspectable var bottomPadding: CGFloat = 0.0 {
        
        didSet {
            
            padding.bottom = bottomPadding
        }
    }
    
    @IBInspectable var rightPadding: CGFloat = 0.0 {
        
        didSet {
            
            padding.right = rightPadding
        }
    }
    
    override func drawText(in rect: CGRect) {
        
        super.drawText(in: rect.inset(by: padding))
    }
    
    // MARK: - Corner Radius
    
//    @IBInspectable var cornerRadius: CGFloat = 0.0 {
//        
//        didSet {
//            
//            self.layer.cornerRadius = cornerRadius
//            
//            self.clipsToBounds = true
//        }
//    }

}
