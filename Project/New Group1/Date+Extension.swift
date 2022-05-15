//
//  Date+Extension.swift
//  Project
//
//  Created by Aya on 5/10/22.
//  Copyright © 2022 Asma hassan. All rights reserved.
//

import Foundation

extension Date {
    func format() -> String {
        let formatter = DateFormatter()
        if Calendar.current.isDateInToday(self) {
            formatter.dateFormat = "h:mm a"
            
        } else {
            formatter.dateFormat = "dd/MM/yy"
        }
        return formatter.string(from: self)
    }
}
