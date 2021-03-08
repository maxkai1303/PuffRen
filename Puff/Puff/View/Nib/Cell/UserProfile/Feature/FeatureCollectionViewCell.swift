//
//  FeatureCollectionViewCell.swift
//  Puff
//
//  Created by 唐紹桓 on 2021/2/22.
//

import UIKit

class FeatureCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(name: String) {
        
        nameLabel.text = name
    }
}
