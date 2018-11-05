//
//  TaskManager.swift
//  Task Manager iOS
//
//  Created by Sawyer Cherry on 11/1/18.
//  Copyright © 2018 Sawyer Cherry. All rights reserved.
//

import Foundation
import RealmSwift

class TaskManager {
    static let sharedInstance = TaskManager()
    
    private init() {
        tasks = realm.objects(Task.self)
    }
    private var tasks: Results<Task>!
    
    let realm = try! Realm()
    
    func getTaskCount() -> Int {
        return tasks.count
    }
    func getTask(at index: Int) -> Task {
        return tasks[index]
    }
    func addTask(task: Task) {
        try! realm.write {
            realm.add(task)
        }
    }
    func removetask(at index: Int) {
        try! realm.write {
            realm.delete(getTask(at: index))
        }
    }
    func checkTaskInOrOut(at index: Int) {
        let taskForIndex = tasks[index]
        try! realm.write {
            taskForIndex.completed = !taskForIndex.completed
            if taskForIndex.completed {
                taskForIndex.dueDate = nil
            }
        }
       
        
        
        }
    }



