//
//  ReportTableViewCell.swift
//  Puff
//
//  Created by Max Kai on 2021/3/8.
//

import UIKit

class ReportTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var statusPFLabel: PFLabel!
    
    @IBOutlet weak var timeImage: UIImageView!
    
    @IBOutlet weak var locationImage: UIImageView!
    
    @IBOutlet weak var openTimeLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var reportButtonOutlet: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setUi() {
        
    }
    
}
