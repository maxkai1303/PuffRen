//
//  UILabel+Extension.swift
//  Puff
//
//  Created by 唐紹桓 on 2021/2/22.
//

import UIKit

extension UILabel {
    
    func addAttributedText(text: String, lineSpaceing: CGFloat) {
        
        let attributedString = NSMutableAttributedString(string: text)
        
        let paragraphStyle = NSMutableParagraphStyle()
        
        paragraphStyle.lineSpacing = lineSpaceing
        
        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: .init(location: 0, length: attributedString.length))
        
        self.attributedText = attributedString
    }
}
