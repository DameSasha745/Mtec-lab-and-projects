//
//  ToDoTVC.swift
//  Project ToDoList
//
//  Created by Sasha Cummings on 3/22/25.
//

import UIKit

class ToDoTVC: UITableViewController, ToDoCellDelegate {
    func checkmarkTapped(sender: ToDoCell) {
        if let indexPath = tableView.indexPath(for: sender) {
            var toDo = todos[indexPath.row]
            toDo.isComplete.toggle()
            todos[indexPath.row] = toDo
            tableView.reloadRows(at: [indexPath], with: .automatic)
            ToDo.saveToDos(todos)
        }
    }
    

    var todos = [ToDo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        
        if let savedToDos = ToDo.loadToDOs() {
            todos = savedToDos
        } else {
            todos = ToDo.loadSampleToDos()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCellIdentifier", for: indexPath) as! ToDoCell
        
        let toDo = todos[indexPath.row]
        cell.titleLabel?.text = toDo.title
        cell.isCompletButton.isSelected = toDo.isComplete
        cell.delegate = self
        
        return cell
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            ToDo.saveToDos(todos)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail", let navController = segue.destination as? UINavigationController, let detailController = navController.topViewController as? ToDoDetailTVC, let selectedCell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: selectedCell) {
            
            detailController.toDo = todos[indexPath.row]
        }
    }
    
    @IBAction func unwindToToDoList(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveUnwind" else { return }
        let sourceViewController = segue.source as! ToDoDetailTVC
        
        if let todo = sourceViewController.toDo {
            if let indexOfExistingToDo = todos.firstIndex(of: todo) {
                todos[indexOfExistingToDo] = todo
                tableView.reloadRows(at: [IndexPath(row: indexOfExistingToDo, section: 0)], with: .automatic)
            } else {
                let newIndexPath = IndexPath(row: todos.count, section: 0)
                todos.append(todo)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
        ToDo.saveToDos(todos)
    }
}

    
    
        
     
