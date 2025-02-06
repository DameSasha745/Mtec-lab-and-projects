//
//  ViewController.swift
//  lab Login
//
//  Created by Sasha Cummings on 2/5/25.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var userName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.navigationItem.title = userName.text
    }

}

