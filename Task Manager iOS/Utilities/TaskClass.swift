//
//  TaskClass.swift
//  Task Manager iOS
//
//  Created by Sawyer Cherry on 11/1/18.
//  Copyright © 2018 Sawyer Cherry. All rights reserved.
//

import Foundation
import RealmSwift


class Task: Object {
    
    @objc dynamic var taskTitle: String = ""
    @objc dynamic var completed: Bool = true
    @objc dynamic var taskRating: String = ""
    @objc dynamic var priority: String = ""
    @objc dynamic var taskDescription: String = ""
    @objc dynamic var dueDate: Date?  = Date()
   
}
