//
//  ToDoDetailTVC.swift
//  Project ToDoList
//
//  Created by Sasha Cummings on 3/22/25.
//

import UIKit

class ToDoDetailTVC: UITableViewController {
    
    var toDo: ToDo?
    
    @IBOutlet var titleTextField: UITextField!
    
    @IBOutlet var isCompletedButton: UIButton!
    
    @IBOutlet var dueDateLabel: UILabel!
    
    @IBOutlet var dueDateDatePicker: UIDatePicker!
    
    @IBOutlet var notesTextView: UITextView!
    
    @IBOutlet var saveButton: UIBarButtonItem!
    
    var isDatePickerHidden = true
    let dateLabelIndexPath = IndexPath(row: 0, section: 1)
    let datePickerIndexPath = IndexPath(row: 1, section: 1)
    let notesIndexPath = IndexPath(row: 0, section: 2)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentDueDate: Date
        if let toDo = toDo {
            navigationItem.title = "To-Do"
            titleTextField.text = toDo.title
            isCompletedButton.isSelected = toDo.isComplete
            currentDueDate = toDo.dueDate
            notesTextView.text = toDo.notes
        } else {
            currentDueDate = Date().addingTimeInterval(24*60*60)
        }
        dueDateDatePicker.date = currentDueDate
        UpdateDueDateLabel(date: currentDueDate)
        updateSaveButtonState()
    }
    func updateSaveButtonState() {
        let shouldEnableSaveButton = titleTextField.text?.isEmpty == false
        saveButton.isEnabled = shouldEnableSaveButton
    }
    func UpdateDueDateLabel(date: Date) {
        dueDateLabel.text = date.formatted(.dateTime.month(.defaultDigits).day().year(.twoDigits).hour().minute())
    }
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()    }
    @IBAction func retrunPressed(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    @IBAction func isCompleteButtonTapped(_ sender: UIButton) {
        isCompletedButton.isSelected.toggle()
    }
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        UpdateDueDateLabel(date: sender.date)
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case datePickerIndexPath where isDatePickerHidden == true:
            return 0
        case notesIndexPath:
            return 200
        default:
            return UITableView.automaticDimension
        }
    }
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case datePickerIndexPath:
            return 216
        case notesIndexPath:
            return 200
        default:
            return UITableView.automaticDimension
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath == dateLabelIndexPath {
            isDatePickerHidden.toggle()
            UpdateDueDateLabel(date: dueDateDatePicker.date)
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "saveUnwind" else { return }
        
        let title = titleTextField.text!
        let isComplete = isCompletedButton.isSelected
        let dueDate = dueDateDatePicker.date
        let notes = notesTextView.text
        
        if toDo != nil {
            toDo?.title = title
            toDo?.isComplete = isComplete
            toDo?.dueDate = dueDate
            toDo?.notes = notes
        } else {
            toDo = ToDo(title: title, isComplete: isComplete, dueDate: dueDate, notes: notes)
        }
    }
}
