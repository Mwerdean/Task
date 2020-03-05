//
//  TaskListTableViewController.swift
//  Task
//
//  Created by Matthew Werdean on 3/5/20.
//  Copyright © 2020 Matthew Werdean. All rights reserved.
//

import UIKit

class TaskListTableViewController: UITableViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskController.shared.tasks.count
        
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        let task = TaskController.shared.tasks[indexPath.row]
        
        cell.textLabel?.text = task.name
        cell.detailTextLabel?.text = task.dueDateAsString
        
        
        return cell
    }


    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let task = TaskController.shared.tasks[indexPath.row]
            TaskController.shared.remove(task: task)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            guard let indexPath = tableView.indexPathForSelectedRow, let destinationVC = segue.destination as? TaskDetailTableViewController else {return}
            let task = TaskController.shared.tasks[indexPath.row]
            // NEEDS a landing pad on task detail
            destinationVC.task = task
        }
    }
}
