//
//  ItemDetailTableViewCell.swift
//  Puff
//
//  Created by 唐紹桓 on 2021/2/22.
//

import UIKit

class ItemDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel! {
        
        didSet {
            
  
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(item: ItemData?) {
        
        guard let item = item else {
            
            return
        }
        
        nameLabel.text = item.name
        
        descriptionLabel.addAttributedText(text: "泡芙人的誠信原則 無添加任何防腐劑及香精 大朋友、小朋友都吃的安心的美味甜點", lineSpaceing: 10)
    }
}
