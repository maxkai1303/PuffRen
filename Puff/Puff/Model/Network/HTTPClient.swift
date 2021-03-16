//
//  HTTPClient.swift
//  NetWorkPractice
//
//  Created by 唐紹桓 on 2021/3/15.
//

import Foundation

enum HTTPHeaderField: String {
    
    case contentType = "Content-Type"
    
    case auth = "Authorization"
}

enum HTTPHeaderValue: String {
    
    case json = "application/json"
    
    case bearer = "Bearer"
}

enum HTTPMethod: String {
    
    case get
    
    case post
}

class HTTPClient {
    
    static func request(_ service: APIService, completion: @escaping (Result<Data>) -> Void) {
        
        URLSession.shared.dataTask(with: service.makeRequest()) { (data, response, error) in
            
            guard error == nil else {
                
                return completion(.failuer(error!))
            }
            
            let httpResponse = response as! HTTPURLResponse
            
            let statusCode = httpResponse.statusCode
            
            switch statusCode {
            
            case 200 ..< 300:
                
                completion(.success(data!))
                
            case 400 ..< 500:
                
                completion(.failuer(HTTPClientError.clientError(data!)))
                
            case 500 ..< 600:
                
                completion(.failuer(HTTPClientError.serverError))
            
            default: return
                
                completion(.failuer(HTTPClientError.unexpectedError))
            }
        }.resume()
    }
}
