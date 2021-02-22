//
//  ViewAnimationHelper.swift
//  Puff
//
//  Created by 唐紹桓 on 2021/2/21.
//

import UIKit

extension CGFloat {
    
    enum AnimationPosition {
        
        case center
        
        case rightOutside(UIView)
        
        case leftOutside
    }
    
    static func moveTo(_ animationPosition: AnimationPosition) -> Self {
        
        switch animationPosition {
        
        case .center: return UIScreen.main.bounds.midX
        
        case .rightOutside(let view): return -(view.frame.size.width)
            
        case .leftOutside: return UIScreen.main.bounds.maxX
            
        }
    }
}
