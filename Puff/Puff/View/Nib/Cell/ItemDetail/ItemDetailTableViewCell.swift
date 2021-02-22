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
        
        descriptionLabel.addAttributedText(text: "採用高級100%棉質素材的外套。輕盈保暖高質感的針織大衣！精緻做工升級，展現高質感氛圍。", lineSpaceing: 10)
    }
}
