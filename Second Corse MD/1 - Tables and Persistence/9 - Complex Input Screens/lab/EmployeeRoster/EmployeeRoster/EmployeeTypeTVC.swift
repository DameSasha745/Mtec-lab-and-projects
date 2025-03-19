//
//  EmployeeTypeTVC.swift
//  EmployeeRoster
//
//  Created by Sasha Cummings on 3/18/25.
//

import UIKit

protocol EmployeeTypeTableViewControllerDelegate: AnyObject {
    func EmployeeTypeTVC(_ controller: EmployeeTypeTVC, didSelect employeeType: EmployeeType)
}

class EmployeeTypeTVC: UITableViewController {
    
    var employeeType: EmployeeType?
    var delegate: EmployeeTypeTableViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EmployeeType.allCases.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeTypeCell", for: indexPath)
        
        let type = EmployeeType.allCases[indexPath.row]
        
        var config = cell.defaultContentConfiguration()
        config.text = type.description
        cell.contentConfiguration = config
        
        if employeeType == type {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedEmployeeType = EmployeeType.allCases[indexPath.row]
        employeeType = selectedEmployeeType
        delegate?.EmployeeTypeTVC(self, didSelect: employeeType!)
        
        tableView.reloadData()
    }
}
