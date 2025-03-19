
import UIKit

protocol EmployeeDetailTableViewControllerDelegate: AnyObject {
    func employeeDetailTableViewController(_ controller: EmployeeDetailTableViewController, didSelect employee: Employee)
  
}

class EmployeeDetailTableViewController: UITableViewController, UITextFieldDelegate {
    
    var employeeType: EmployeeType?
    
    var isEditingBirthday: Bool = false {
        didSet {
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var dobLabel: UILabel!
    @IBOutlet var employeeTypeLabel: UILabel!
    @IBOutlet var saveBarButtonItem: UIBarButtonItem!
    @IBOutlet var doDatePicker: UIDatePicker!
    
    weak var delegate: EmployeeDetailTableViewControllerDelegate?
    var employee: Employee?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let employeeType = employeeType {
            employeeTypeLabel.text = employeeType.description
            employeeTypeLabel.textColor = .black
        } else {
            employeeTypeLabel.text = "Select Employee Type"
            employeeTypeLabel.textColor = .none
        }
        
        updateView()
        updateSaveButtonState()
    }
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        updateView()
    }
    
    @IBSegueAction func showEmployeeTypes(_ coder: NSCoder) -> EmployeeTypeTVC? {
        let selectEmployeeTypeController = EmployeeRoster.EmployeeTypeTVC(coder: coder)
        selectEmployeeTypeController?.delegate = self
        return selectEmployeeTypeController
    }
    
    
    func updateView() {
        if let employee = employee {
            navigationItem.title = employee.name
            nameTextField.text = employee.name
            
            dobLabel.text = employee.dateOfBirth.formatted(date: .abbreviated, time: .omitted)
            dobLabel.textColor = .label
            employeeTypeLabel.text = employee.employeeType.description
            employeeTypeLabel.textColor = .label
        } else {
            navigationItem.title = "New Employee"
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 2 {
            if isEditingBirthday {
                return UITableView.automaticDimension
            } else {
                return 0
            }
        }
        return UITableView.automaticDimension
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 1 {
            isEditingBirthday.toggle()
            
            if !isEditingBirthday {
                dobLabel.text = doDatePicker.date.formatted(date: .abbreviated, time: .omitted)
                dobLabel.textColor = .label
            } else {
                dobLabel.textColor = .systemBlue
            }
        }
    }
    private func updateSaveButtonState() {
        let employeeType = nameTextField.text?.isEmpty == false
        saveBarButtonItem.isEnabled = employeeType
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text else {
            return
        }
        guard let unwrappedEmployeeType = employeeType else { return }
        
        let employee = Employee(name: name, dateOfBirth: doDatePicker.date, employeeType: unwrappedEmployeeType)
        delegate?.employeeDetailTableViewController(self, didSelect: employee)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        employee = nil
    }

    @IBAction func nameTextFieldDidChange(_ sender: UITextField) {
        updateSaveButtonState()
    }
}
extension EmployeeDetailTableViewController: EmployeeTypeTableViewControllerDelegate {
    func EmployeeTypeTVC(_ controller: EmployeeTypeTVC, didSelect employeeType: EmployeeType) {
        self.employeeType = employeeType
        updateSaveButtonState()
    }
}
