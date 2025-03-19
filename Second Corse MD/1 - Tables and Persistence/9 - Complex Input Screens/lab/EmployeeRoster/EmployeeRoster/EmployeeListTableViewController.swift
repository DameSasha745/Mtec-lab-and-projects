
import UIKit

class EmployeeListTableViewController: UITableViewController, EmployeeDetailTableViewControllerDelegate {
    
    var employees: [Employee] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeCell", for: indexPath)
        
        let employee = employees[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = employee.name
        content.secondaryText = employee.employeeType.description
        cell.contentConfiguration = content
        
        return cell
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            employees.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    @IBSegueAction func showEmployeeDetail(_ coder: NSCoder, sender: Any?) -> EmployeeDetailTableViewController? {
        
        let detailViewController = EmployeeDetailTableViewController(coder: coder)
        detailViewController?.delegate = self
        
        guard
            let cell = sender as? UITableViewCell,
            let indexPath = tableView.indexPath(for: cell)
        else {
            return detailViewController
        }
        
        let employee = employees[indexPath.row]
        detailViewController?.employee = employee
        
        return detailViewController
    }
    @IBAction func unwindToEmployeeList(segue: UIStoryboardSegue) {
        tableView.reloadData()
    }
    func employeeDetailTableViewController(_ controller: EmployeeDetailTableViewController, didSelect employee: Employee) {
        
        if let indexPath = tableView.indexPathForSelectedRow {
            employees.remove(at: indexPath.row)
            employees.insert(employee, at: indexPath.row)
        } else {
            employees.append(employee)
        }
        
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
}
