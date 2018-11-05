//
//  TaskDetailsViewController.swift
//  Task Manager iOS
//
//  Created by Sawyer Cherry on 11/2/18.
//  Copyright © 2018 Sawyer Cherry. All rights reserved.
//

import UIKit

class TaskDetailsViewController: UIViewController {
    @IBOutlet weak var taskTitleOnDescriptionScreen: UILabel!
 
    @IBOutlet weak var taskDescriptionLabelThing: UILabel!
    // Tying the class to the task description so it will know where it comes from
    var taskDescription: Task!
    var taskTitle: Task!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Displays the taskDescription and the taskTitle when the page is loaded
        taskDescriptionLabelThing.text = taskDescription.taskDescription
        taskTitleOnDescriptionScreen.text = taskTitle.taskTitle
    }
}
