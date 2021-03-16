//
//  APIServices.swift
//  NetWorkPractice
//
//  Created by 唐紹桓 on 2021/3/15.
//

import Foundation

enum APIService {
    
    case userProfile(String)
    
    case items
    
    case map
    
    case storeRecord
}

extension APIService: TargetType {

    var headers: [String : String]? {
        
        return nil
    }
    
    var baseURL: String {
        
        return "https://api.appworks-school.tw/api/1.0"
    }
    
    var body: Data? {
        
        return nil
    }
    
    var path: String {
        
        switch self {
        
        case .userProfile(_):
            
            return "/marketing/hots"
            
        case .items:
            
            return "items"
            
        case .map:
            
            return "map"
            
        case .storeRecord:
            
            return "storeRecord"
        }
    }
    
    var method: HTTPMethod {
        
        switch self {
        
        case .userProfile(_): return .get
            
        case .items: return .get
            
        case .map: return .get
            
        case .storeRecord: return .get
            
        }
    }
}
