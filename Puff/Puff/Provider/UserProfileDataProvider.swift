//
//  UserProfileDataProvider.swift
//  Puff
//
//  Created by 唐紹桓 on 2021/2/22.
//

import Foundation

class UserProfileDataProvider {
    
    enum LoginStatus {
        
        case member
        
        case store
    }
    
    enum SectionHeaderData: CaseIterable {
        
        case userProfile
        
        case memberFeature
        
        case storeFeature
    }
    
    enum MemberFeature: String, CaseIterable {
        
        static let title = "會員功能"
        
        case record = "訂單查詢"
        
        case edit = "會員資料修改"
        
        case event = "會員專屬活動"
        
        case quickResponseCode = "QRCode"
    }
    
    enum StoreFeature: String, CaseIterable {
        
        static let title = "攤主功能"
        
        case stateReport = "營業狀況回報"
        
        case recordReport = "營業紀錄回報"
        
        case quickResponseCode = "QRCode"
    }
}
