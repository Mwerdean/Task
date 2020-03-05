//
//  TaskController.swift
//  Task
//
//  Created by Matthew Werdean on 3/5/20.
//  Copyright © 2020 Matthew Werdean. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    
    // MARK: - Singleton
    static let shared = TaskController()
    // MARK: - Source of Truth
    var tasks: [Task] = []
//    {
//        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
//        return (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
//    }
    
    init() {
        tasks = fetchedTasks()
    }
    
    // MARK: - Mock Data
    var mockTasks: [Task] {
        let task1 = Task(name: "Do pre-work")
        let task2 = Task(name: "Finish iOS course", notes: "get badge by graduation day", due: Date())
        let task3 = Task(name: "Drive to Utah")
        task3.isComplete = true
        return [task1, task2, task3]
    }
    
    // MARK: - CRUD
    func add(taskWithName name:String, notes: String?, due: Date?) {
//        Task(name: name, notes: notes, due: due)
//        saveToPersistentStore()
    }
    
    func update(task: Task, name: String, notes: String?, due: Date?) {
      
    }
    
    func remove(task: Task) {
//        CoreDataStack.context.delete(task)
//        saveToPersistentStore()
    }
    
    func saveToPersistentStore(){
        do {
            try CoreDataStack.context.save()
        } catch {
            print("There was an error saving the data \(#function) \(error.localizedDescription)")
        }
    }
    
    func fetchedTasks() -> [Task] {
        return mockTasks
    }
    
}
