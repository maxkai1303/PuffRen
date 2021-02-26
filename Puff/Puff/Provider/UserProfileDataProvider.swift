//
//  UserProfileDataProvider.swift
//  Puff
//
//  Created by 唐紹桓 on 2021/2/22.
//

import Foundation

class UserProfileDataProvider {
    
    enum DataType: CaseIterable {
        
        static var allCases: [UserProfileDataProvider.DataType] {
            
            return [.userProfile,
                    memberFeature("會員功能", MemberFeature.allCases),
                    storeFeature("攤主功能", StoreFeature.allCases)]
        }
        
        case userProfile
        
        case memberFeature(String ,[MemberFeature])
        
        case storeFeature(String, [StoreFeature])
    }
    
    enum MemberFeature: String, CaseIterable {
        
        case record = "訂單查詢"
        
        case edit = "會員資料修改"
        
        case event = "會員專屬活動"
        
        case quickResponseCode = "QRCode"
    }
    
    enum StoreFeature: String, CaseIterable {
        
        case stateReport = "營業狀況回報"
        
        case recordReport = "營業紀錄回報"
        
        case edit = "查看營業紀錄"
        
        case quickResponseCode = "QRCode"
    }
}
