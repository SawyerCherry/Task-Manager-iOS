//
//  TableViewController.swift
//  Task Manager iOS
//
//  Created by Sawyer Cherry on 10/31/18.
//  Copyright © 2018 Sawyer Cherry. All rights reserved.
//

import UIKit
import RealmSwift

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var currentTask: Task!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    // setting the info for the Task details
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as?
            TaskDetailsViewController {
            destination.taskDescription = currentTask
            destination.taskTitle = currentTask
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskManager.sharedInstance.getTaskCount()
    }
    //  now passing the data through the segue using currentTask
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        currentTask = TaskManager.sharedInstance.getTask(at: indexPath.row)
        self.performSegue(withIdentifier: "showTaskDetails", sender: self)
    }
    // puttung the data into the cell for the taskl title and the priority
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TaskTableViewCell
        
        cell.taskTitleLabel.text = TaskManager.sharedInstance.getTask(at: indexPath.row).taskTitle
        cell.priorityLabel.text = TaskManager.sharedInstance.getTask(at: indexPath.row).priority
        
        // Creating the date formatter for the date
        let date = TaskManager.sharedInstance.getTask(at: indexPath.row).dueDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, h:mm a"
        
        // Actually making the colors change using if statement
        
        if !TaskManager.sharedInstance.getTask(at: indexPath.row).completed {
            cell.comOrIncomView.backgroundColor = UIColor.red
        } else {
            cell.comOrIncomView.backgroundColor = UIColor.green
        }
// task not completed then it will show due date, vice versa
        if !TaskManager.sharedInstance.getTask(at: indexPath.row).completed {
            cell.dueDateLabel.text = dateFormatter.string(from: date!)
        } else {
             cell.dueDateLabel.text = ""
        }
        
        return cell
        
    }
    // Big function to show options when the cell is slid over, slides to far and it will destruct the cell.
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        // destruct the cell
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _,_ in
       
            TaskManager.sharedInstance.removetask(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        // Declaring this now so I will not have to type it out so many times
        let taskForIndex = TaskManager.sharedInstance.getTask(at: indexPath.row)
        // The two different titles for the state of the task
        let title = !taskForIndex.completed ? "Check Complete" : "Check Incomplete"
        // giving the user the option to either check in or out
        let checkComOrIncomAction = UITableViewRowAction(style: .normal, title: title) { _, _ in
            
            TaskManager.sharedInstance.checkTaskInOrOut(at: indexPath.row)
            tableView.reloadRows(at: [indexPath], with: .fade)
        }
    // HAHA you can only change the state of the task once, choose wisely
        if TaskManager.sharedInstance.getTask(at: indexPath.row).completed {
            return [deleteAction]
        } else {
            return [deleteAction, checkComOrIncomAction]
        }
        
    }
    
}

