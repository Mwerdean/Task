//
//  Task+Convenience.swift
//  Task
//
//  Created by Matthew Werdean on 3/5/20.
//  Copyright © 2020 Matthew Werdean. All rights reserved.
//

import Foundation
import CoreData

extension Task {
    @discardableResult
    
    convenience init(name: String, notes: String? = nil, due: Date? = nil, moc: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: moc)
        self.name = name
        self.notes = notes
        self.due = due
    }
    
    var dueDateAsString: String {
        get {
            guard let date = due else { return "no date set" }
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .short
            dateFormatter.timeStyle = .medium
            return dateFormatter.string(from: date)
        }
    }
}


