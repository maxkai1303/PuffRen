//
//  AddCarTableViewCell.swift
//  Puff
//
//  Created by Max Kai on 2021/3/7.
//

import UIKit

class AddCarTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageOutlet: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var amountTextField: UITextField!
    
    // 加減按鈕還沒拉
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setUi() {
        
        
    }
    
}
