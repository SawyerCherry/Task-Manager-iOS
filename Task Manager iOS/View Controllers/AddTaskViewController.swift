//
//  AddTaskViewController.swift
//  Task Manager iOS
//
//  Created by Sawyer Cherry on 10/31/18.
//  Copyright © 2018 Sawyer Cherry. All rights reserved.
//

import UIKit
import RealmSwift

class AddTaskViewController: UIViewController {
   
    @IBOutlet weak var taskTitleTextField: UITextField!
    
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var prioritySegmentedController: UISegmentedControl!
    
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // touch screen to make keyboard go away
        
        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    @IBAction func submitButtonTapped(_ sender: Any) {
       
        guard let title = taskTitleTextField.text, title.trimmingCharacters(in: .whitespacesAndNewlines) != ""
            else {
                return
        }
        guard let description = descriptionTextField.text, description.trimmingCharacters(in: .whitespacesAndNewlines) != "" else {
            return
        }

        var priority: String!
        switch prioritySegmentedController.selectedSegmentIndex {
        case 0:
            priority = "First"
        case 1:
            priority = "Second"
        case 2:
            priority = "Third"
        case 3:
            priority = "Fourth"
        case 4:
            priority = "Fifth"
        default:
            priority = "First"
        }

       let newTask = Task()
      
        newTask.taskTitle = title
        newTask.taskDescription = description
        newTask.completed = false
        newTask.priority = priority
        newTask.dueDate = dueDatePicker.date
    
    
        TaskManager.sharedInstance.addTask(task: newTask)
        
        self.performSegue(withIdentifier: "showTaskTable", sender: self)
        
    
    }
        
}
    
    
    // MARK: - Navigation




