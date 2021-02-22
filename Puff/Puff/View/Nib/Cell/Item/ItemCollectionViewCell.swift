//
//  ItemCollectionViewCell.swift
//  Puff
//
//  Created by 唐紹桓 on 2021/2/8.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var itemImageView: UIImageView! {
        
        didSet {
            
            
        }
    }
    
    @IBOutlet weak var itemNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(name: String, image: UIImage) {
    
        itemImageView.image = image
        
        itemNameLabel.text = name
        
        itemImageView.setupShadow()
    }
}
