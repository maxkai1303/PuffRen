//
//  Date+Extension.swift
//  CalendarTest
//
//  Created by 唐紹桓 on 2021/3/7.
//

import Foundation

extension Date {
    
    //
    
    func getFirstWeekDayThisMonth() -> Int {
    
        let calendar = Calendar.current
    
        var components = calendar.dateComponents([.year, .month, .day], from: self)
        
        components.day = 1
        
        guard let date = calendar.date(from: components),
              let firstWeekDay = calendar.ordinality(of: .weekday, in: .weekOfMonth, for: date)
        else {
            return 0
        }
        
        return firstWeekDay == 7 ? 0 : firstWeekDay
    }
    
    func getDayCountThisMonth() -> Int {
        
        guard let range = Calendar.current.range(of: .day, in:.month, for: self) else {
            
            return 0
        }
        
        return range.count
    }
    
    enum ChageType {
        
        case prev
        
        case next
    }
    
    mutating func changeMonth(_ type: ChageType) {
        
        switch type {
        
        case .prev:
            
            guard let prevMonth =  Calendar.current.date(byAdding: .month, value: -1, to: self) else {
                
                 return
            }
            
            self = prevMonth
        
        case .next:
            
            guard let nextMonth =  Calendar.current.date(byAdding: .month, value: 1, to: self) else {
                
                 return
            }
            
            self = nextMonth
        }
    }
}
