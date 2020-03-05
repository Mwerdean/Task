//
//  DateHelpers.swift
//  Task
//
//  Created by Matthew Werdean on 3/5/20.
//  Copyright © 2020 Matthew Werdean. All rights reserved.
//

import Foundation

extension Date {
    func stringValue() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        return formatter.string(from: self)
    }
}
