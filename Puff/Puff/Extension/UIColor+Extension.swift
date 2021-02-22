//
//  UIColor+Extension.swift
//  Puff
//
//  Created by 唐紹桓 on 2021/2/8.
//

import UIKit

extension UIColor {
   
    private enum PFColor: String {
        
        case main = "Main"
    }
    
    static let main = getColor(.main)
    
    private static func getColor(_ color: PFColor) -> UIColor {
        
        return UIColor(named: color.rawValue)!
    }
}
