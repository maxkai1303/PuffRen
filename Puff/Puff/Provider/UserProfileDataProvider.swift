//
//  UserProfileDataProvider.swift
//  Puff
//
//  Created by 唐紹桓 on 2021/2/22.
//

import Foundation

class UserProfileDataProvider {
    
    enum DataType: Int, CaseIterable{
        
        case userProfile = 0
        
        case memberFeature
        
        case storeFeature
    }
    
    enum MemberFeature: Int, CaseIterable {
        
        case record = 0
        
        case edit
        
        case event
        
        case quickResponseCode
    }
    
    enum StoreFeature: Int, CaseIterable {
        
        case stateReport = 0
        
        case recordReport
        
        case quickResponseCode
    }
}
