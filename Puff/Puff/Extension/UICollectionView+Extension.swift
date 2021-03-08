//
//  UICollectionView+Extension.swift
//  Puff
//
//  Created by 唐紹桓 on 2021/2/8.
//

import UIKit

extension UICollectionView {
    
    enum ViewType: String {

        case header = "UICollectionElementKindSectionHeader"

        case footer = "UICollectionElementKindSectionFooter"
    }
    
    
    
    // Register
    
    func registerNib(cell: UICollectionViewCell.Type) {
        
        let nib = UINib(nibName: cell.nibName, bundle: nil)
        
        register(nib, forCellWithReuseIdentifier: cell.identifier)
    }
    
    func registerHeaderNib(reusableView: UICollectionReusableView.Type, type: ViewType) {
        
        let nib = UINib(nibName: reusableView.nibName, bundle: nil)
        
        register(nib, forSupplementaryViewOfKind: type.rawValue, withReuseIdentifier: reusableView.identifier)
    }
    
    // Reusable
    
    func reuse<T: UICollectionViewCell>(cell: T.Type, for indexPath: IndexPath) -> T {
        
        return self.dequeueReusableCell(withReuseIdentifier: cell.identifier, for: indexPath) as! T
    }
    
    func reuseView<T: UICollectionReusableView>(view: T.Type, kind: String, for indexPath: IndexPath) -> T {
        
        return self.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: view.identifier, for: indexPath) as! T
    }
}
