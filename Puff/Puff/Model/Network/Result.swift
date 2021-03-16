//
//  Result.swift
//  NetWorkPractice
//
//  Created by 唐紹桓 on 2021/3/15.
//

import Foundation

enum Result<T> {
    
    case success(T)
    
    case failuer(Error)
}
