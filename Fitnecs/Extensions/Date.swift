//
//  Date.swift
//  Fitnecs
//
//  Created by Panov Sergey on 29.09.2020.
//

import UIKit

extension Date {
    
    var startOfDay: Date {
        return Calendar.current.startOfDay(for: self)
    }

    var endOfDay: Date {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfDay)!
    }

    var startOfMonth: Date {
        let components = Calendar.current.dateComponents([.year, .month], from: startOfDay)
        return Calendar.current.date(from: components)!
    }

    var endOfMonth: Date {
        var components = DateComponents()
        components.month = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfMonth)!
    }



    func dayOfTheWeek() -> String? {
        let weekdays = self.weekdays()
        let dayNumber = Calendar.current.component(.weekday, from: self)
        return weekdays[dayNumber - 1]
    }

    func dayOfTheWeekNum() -> Int {
        return Calendar.current.component(.weekday, from: self) - 1
    }

    func lastWeekDaysArray() -> [String] {
        let weekdays = self.weekdays()
        let weekDaysAmount = 7
        let currentDayIndex = (self.dayOfTheWeekNum() - 1) >= 0 ? self.dayOfTheWeekNum() : weekDaysAmount + self.dayOfTheWeekNum()
        var finalDaysArray: [String] = [""]

        for i in 0..<weekDaysAmount {
            let index = (currentDayIndex + i) % weekDaysAmount
            finalDaysArray.append(weekdays[index])
        }

        return finalDaysArray
    }

    func weekdays() -> [String] {
        return [
            "Вс",
            "Пн",
            "Вт",
            "Ср",
            "Чт",
            "Пт",
            "Сб"
        ]
    }


}

extension Date {

    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }

    func format() -> String {
        let dateFormatter = ISO8601DateFormatter()
        return dateFormatter.string(from: self)
    }

}
