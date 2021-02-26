//
//  FeatureHeaderCollectionReusableView.swift
//  Puff
//
//  Created by 唐紹桓 on 2021/2/22.
//

import UIKit

class FeatureHeaderCollectionReusableView: UICollectionReusableView {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(_ title: String) {
        
        titleLabel.text = title
    }
}
