//
//  HTTPClientError.swift
//  NetWorkPractice
//
//  Created by 唐紹桓 on 2021/3/15.
//

import Foundation

enum HTTPClientError: Error {
    
    case decodeDataFail
    
    case clientError(Data)
    
    case serverError
    
    case unexpectedError
}
