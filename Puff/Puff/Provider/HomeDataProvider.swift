//
//  HomeDataProvider.swift
//  Puff
//
//  Created by 唐紹桓 on 2021/2/8.
//

import UIKit

class HomeDataProvider {
    
    enum DataType: Int, CaseIterable {
        
        case map = 0
        
        case item
        
        case member
    }
    
    func postData(index: Int) -> (UIImage, String) {
        
        switch DataType.init(rawValue: index) {
            
        case .map:
            
            return (#imageLiteral(resourceName: "Location"), "泡芙人位置")
            
        case .item:
            
            return  (#imageLiteral(resourceName: "Item"), "商品品項")
            
        case .member:
            
            return (#imageLiteral(resourceName: "Member"), "虛擬會員卡")
            
        case .none:
            
            return (UIImage(), "資料有誤")
        }
    }
}
