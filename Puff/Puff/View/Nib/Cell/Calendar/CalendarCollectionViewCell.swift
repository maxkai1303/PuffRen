//
//  CalendarCollectionViewCell.swift
//  CalendarTest
//
//  Created by 唐紹桓 on 2021/3/3.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellIsSelectedView: UIView!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var eventView: UIView! {
            
        didSet {
            
            eventView.isHidden = true
        }
    }
    
    @IBOutlet weak var topBorderLineView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        // Initialization code
    }
    
    override func layoutSubviews() {
        
        setupBoarderAndCornerRadius()
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        
        layoutIfNeeded()
    
        return layoutAttributes
    }

    func setupBoarderAndCornerRadius() {
        
        eventView.setupBorder(width: 0.8, color: .white)
        
        eventView.cornerRadius = eventView.height / 2
        
        cellIsSelectedView.cornerRadius = cellIsSelectedView.height / 2
    }

    func setup(date: Int, _ isSelected: Bool) {
        
        dateLabel.isHidden = date == 0
        
//        eventView.isHidden = date == 0
        
        topBorderLineView.isHidden = date == 0
        
        dateLabel.text = String(date)
        
        dateLabel.textColor = isSelected == true ? .white : .black
        
        cellIsSelectedView.backgroundColor = isSelected  == true ? .main : .background
    }
}
