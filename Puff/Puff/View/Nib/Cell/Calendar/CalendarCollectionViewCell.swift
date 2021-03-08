//
//  CalendarCollectionViewCell.swift
//  CalendarTest
//
//  Created by 唐紹桓 on 2021/3/3.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var eventView: UIView!
    
    @IBOutlet weak var topBorderLineView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func layoutSubviews() {
        
        eventView.layer.borderWidth = 0.8
        
        eventView.layer.borderColor = UIColor.lightGray.cgColor
        
        eventView.layer.cornerRadius = eventView.frame.height / 2
    }
    
    func setup(date: Int) {
        
        dateLabel.isHidden = date == 0
        
        eventView.isHidden = date == 0
        
        topBorderLineView.isHidden = date == 0
        
        dateLabel.text = String(date)
    }
}
