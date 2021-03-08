//
//  UserProfileCollectionViewCell.swift
//  Puff
//
//  Created by 唐紹桓 on 2021/2/22.
//

import UIKit

class UserProfileCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var memberLevelLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup() {
        
        userNameLabel.text = "eric tang"
        
        memberLevelLabel.text = "白金泡芙"
    }
}
