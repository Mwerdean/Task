//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by Matthew Werdean on 3/5/20.
//  Copyright © 2020 Matthew Werdean. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var notesTextField: UITextView!
    @IBOutlet weak var dueTextField: UITextField!
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    var task: Task? {
        didSet {
            updateViews()
        }
    }
    
    var dueDateValue: Date?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        dueTextField.inputView = dueDatePicker
        //Creating out tap gesture
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(userTappedView))
        //adding our tap gesture to our view
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        dueTextField.text = dueDatePicker.date.stringValue()
        dueDateValue = dueDatePicker.date
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let task = task, let name = nameTextField.text, let note = notesTextField.text else {return}
        
        TaskController.shared.update(task: task, name: name, notes: note, due: Date())
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func userTappedView(_ sender: Any) {
        nameTextField.resignFirstResponder()
        notesTextField.resignFirstResponder()
        dueTextField.resignFirstResponder()
    }
    
    func updateViews() {
        guard let task = task else {return}
        nameTextField.text = task.name
        notesTextField.text = task.notes
        dueTextField.text = task.due?.stringValue()
    }

}
