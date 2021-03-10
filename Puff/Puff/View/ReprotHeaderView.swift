//
//  ReprotHeaderView.swift
//  Puff
//
//  Created by Max Kai on 2021/3/9.
//

import UIKit

class ReprotHeaderView: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var subtitleLabel: UILabel!
    
    @IBOutlet weak var statusLabel: PFLabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setText()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setText()
    }
    
    
    func setText() {
        
        let subtitle = "每日 24：00 前完成營收回報"
        
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: subtitle)
        
        attributedString.setColorForText(textForAttribute: "24：00 前", withColor: UIColor.red)
        
        subtitleLabel.attributedText = attributedString
        
    }
}

extension NSMutableAttributedString {

    func setColorForText(textForAttribute: String, withColor color: UIColor) {
        
        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)

        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)

    }

}
