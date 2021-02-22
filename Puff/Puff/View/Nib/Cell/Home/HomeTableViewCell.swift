//
//  HomeTableViewCell.swift
//  Puff
//
//  Created by 唐紹桓 on 2021/2/8.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView! {
        
        didSet {
            
            cardView.setupShadow()
        }
    }
    
    @IBOutlet weak var homeImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: PFLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(_ image: UIImage, _ title: String) {
        
        homeImageView.image = image
        
        titleLabel.text = title
    }
}
