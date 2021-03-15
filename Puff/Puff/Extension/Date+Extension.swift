//
//  Date+Extension.swift
//  CalendarTest
//
//  Created by 唐紹桓 on 2021/3/7.
//

import Foundation

extension Date {

    // MARK - 取得今天日期
    
    func getToday() -> Int {
        
        return Calendar.current.component(.day, from: self)
    }
    
    // MARK: - 取得當月第一天是星期幾
    
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
    
    // MARK: - 取得當月有幾天
    
    func getDayCountThisMonth() -> Int {
        
        guard let range = Calendar.current.range(of: .day, in:.month, for: self) else {
            
            print(#function, "range is nil so return 0")
            
            return 0
        }
        
        return range.count
    }
    
    // MARL: - 是否是這個月
    
    func isThisMonth() -> Bool {
        
        let calendar = Calendar.current
        
        let newDate = calendar.dateComponents([.year, .month, .day], from: self)
        
        let current = calendar.dateComponents([.year, .month, .day], from: Date())
        
        return newDate.year == current.year && newDate.month == current.month
    }
    
    // MARK: - 切換月份相關
    
    enum ChageType {
        
        case prev, next
    }
    
    mutating func getNewMonth(_ type: ChageType) {
        
        switch type {
        
        case .prev:
            
            guard let prevMonth =  Calendar.current.date(byAdding: .month, value: -1, to: self) else { return }
            
            self = prevMonth
        
        case .next:
            
            guard let nextMonth =  Calendar.current.date(byAdding: .month, value: 1, to: self) else { return }
            
            self = nextMonth
        }
    }
}
