//
//  CalendarManager.swift
//  CalendarTest
//
//  Created by 唐紹桓 on 2021/3/7.
//

import Foundation

class CalendarManager {
    
    // 日曆模組陣列
    
    var dateArray: [Int] = []
    
    var date: Date {
        
        didSet {
            
            createDateDataModel()
        }
    }
    
    // 當月的第一天, 顯示的會是第一天是星期幾，星期一就是 1
    
    private var firstDayThisMonth: Int {
        
        return date.getFirstWeekDayThisMonth()
    }

    // 當月有幾天
    
    private var dayCountThisMonth: Int {

        return date.getDayCountThisMonth()
    }
    
    init(date: Date) {
        
        self.date = date
        
        createDateDataModel()
    }

    // 建立日曆模型
    
    private func createDateDataModel() {
        
        // 建立一個 6 * 7 的陣列都是 0 的陣列。
        // 為什麽是 42 是因為原本要做當月還要看到前面、後面日期的日曆，後面改動成不需要顯示前後日期，所以先不改動。
        
        dateArray = [Int](repeating: 0, count: 42)
        
        var firstDay = firstDayThisMonth
        
        // 從 1 到 當月的天數
        
        for day in 1 ... dayCountThisMonth {
            
            // firstDay 為這個月的第一天是星期幾，以此往後加，把這個月的日期都改動
            
            dateArray[firstDay] = day
            
            firstDay += 1
        }
        
        print(#function, dateArray)
    }
    
//    private func getPrevDate() {
//
//        guard let prevMonth = Calendar.current.date(byAdding: .month, value: -1, to: date) else {
//
//            return
//        }
//
//        let lastWeekDayPrevMonth = prevMonth.getDayCountThisMonth()
//
//        for index in 0 ..< firstDayThisMonth {
//
//            dateArray[index] = lastWeekDayPrevMonth - index
//        }
//    }
//
//    private func getNextDate() {
//
//        var day = 1
//
//        for (index, date) in dateArray.enumerated() where date == 0 {
//
//            dateArray[index] = day
//
//            day += 1
//        }
//    }
}
