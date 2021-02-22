//
//  HTTPClient.swift
//  Puff
//
//  Created by 唐紹桓 on 2021/2/12.
//

import Foundation

enum Result<T> {
    
    case success(T)
    
    case failuer(Error)
}

enum STHTTPClientError: Error {

    case decodeDataFail

    case clientError(Data)

    case serverError

    case unexpectedError
}


enum HTTPHeaderField: String {
    
    case contentType = "Content-Type"

    case auth = "Authorization"
}

enum HTTPHeaderValue: String {

    case json = "application/json"
    
    case bearer = "Bearer"
    
}

protocol PFRequest {

    var headers: [String: String] { get }

    var body: Data? { get }

    var method: String { get }

    var endPoint: String { get }
}

extension PFRequest {
    
    func makeRequest() -> URLRequest {
        
        let url = URL(string: "")!
        
        var request = URLRequest(url: url)
        
        request.allHTTPHeaderFields = headers
        
        request.httpBody = body
        
        request.httpMethod = method
        
        return request
    }
}

class HTTPClient {
    
    static let shared = HTTPClient()
    
    private let decoder = JSONDecoder()
    
    private let encoder = JSONEncoder()
    
    private init() {}
    
    func request(_ request: PFRequest, completion: @escaping (Result<Data>) -> Void) {
        
        URLSession.shared.dataTask(with: request.makeRequest(), completionHandler: { (data, response, error) in
            
            guard error == nil else {
                
                return completion(Result.failuer(error!))
            }
            
            let httpResponse = response as! HTTPURLResponse
            
            let statusCode = httpResponse.statusCode
            
            switch statusCode {
            
            case 200 ..< 300:
                
                completion(.success(data!))
                
            case 400 ..< 500:
                
                completion(.failuer(STHTTPClientError.clientError(data!)))
                
            case 500 ..< 600:
                
                completion(.failuer(STHTTPClientError.serverError))
                
            default: return
                
                completion(.failuer(STHTTPClientError.unexpectedError))
            }
        }).resume()
    }
}
