//
//  HomeCellTableViewCell.swift
//  Puff
//
//  Created by Max Kai on 2021/1/21.
//

import UIKit

protocol UITableViewCellDelegate: AnyObject {
    
    func elementIsAction(value: Any)
}

class HomeCellTableViewCell: UITableViewCell {

    weak var delegate: UITableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    @IBOutlet weak var cellImage: UIImageView! {
        
        didSet {
            
            cellImage.setupShadow()
            
            cellImage.addTapAction(sender: self, selector: #selector(didTap))
        }
    }
    
    @objc func didTap() {
        
        delegate?.elementIsAction(value: cellImage.tag)
    }
}
