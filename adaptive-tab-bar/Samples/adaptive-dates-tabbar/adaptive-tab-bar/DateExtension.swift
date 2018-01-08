//
//  DateExtension.swift
//  adaptive-tab-bar
//
//  Created by Arcilite on 16.09.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit

extension Date {
    
    init(dateString: String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = Locale(identifier: "en_US_POSIX")
        let d = dateStringFormatter.date(from: dateString) ?? Date()
        self.init(timeInterval: 0, since: d)
    }

    func daysBetween(dateFrom: Date, dateTo: Date) -> Int {
        let units = Set<Calendar.Component>([.day])
        let components = NSCalendar.current.dateComponents(units, from: dateFrom, to: dateTo)
        return (components.day ?? 0) + 1
    }
}
