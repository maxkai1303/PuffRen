//
//  UICollectionView+Extension.swift
//  Puff
//
//  Created by 唐紹桓 on 2021/2/8.
//

import UIKit

extension UICollectionView {
    
    func registerNib(cell: UICollectionViewCell.Type) {
        
        let nib = UINib(nibName: cell.nibName, bundle: nil)
        
        register(nib, forCellWithReuseIdentifier: cell.identifier)
    }
    
    func registerHeaderNib(reusableView: UICollectionReusableView.Type) {
        
        let nib = UINib(nibName: reusableView.nibName, bundle: nil)
        
        register(nib, forSupplementaryViewOfKind: "Header", withReuseIdentifier: reusableView.identifier)
    }
    
    func reuse<T: UICollectionViewCell>(cell: T.Type, for indexPath: IndexPath) -> T {
        
        return self.dequeueReusableCell(withReuseIdentifier: cell.identifier, for: indexPath) as! T
    }
    

}
