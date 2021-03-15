//
//  APITargetType.swift
//  NetWorkPractice
//
//  Created by 唐紹桓 on 2021/3/15.
//

import Foundation

protocol TargetType {
    
    var headers: [String: String]? { get }
    
    var baseURL: String { get }
    
    var body: Data? { get }
    
    var path: String { get }
    
    var method: HTTPMethod { get }
}

extension TargetType {
    
    func makeRequest() -> URLRequest {
        
        let url = URL(string: baseURL + path)!
        
        var request = URLRequest(url: url)
        
        request.allHTTPHeaderFields = headers
        
        request.httpMethod = method.rawValue
        
        request.httpBody = body
        
        return request
    }
}
