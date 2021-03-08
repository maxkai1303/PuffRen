//
//  CalendarManager.swift
//  CalendarTest
//
//  Created by 唐紹桓 on 2021/3/7.
//

import Foundation

class CalendarManager {
    
    var dateArray: [Int] = []
    
    var date: Date {
        
        didSet {
            
            createDateDataModel()
        }
    }
    
    private var firstDayThisMonth: Int {
        
        return date.getFirstWeekDayThisMonth()
    }

    private var dayCountThisMonth: Int {

        return date.getDayCountThisMonth()
    }
    
    init(date: Date) {
        
        self.date = date
        
        createDateDataModel()
    }

    private func createDateDataModel() {
        
        dateArray = [Int](repeating: 0, count: 42)
        
        var firstDay = firstDayThisMonth
        
        print(#function, firstDay)
        
        for day in 1 ... dayCountThisMonth {
            
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
