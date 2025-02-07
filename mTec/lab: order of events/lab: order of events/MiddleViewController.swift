//
//  MiddleViewController.swift
//  lab: order of events
//
//  Created by Sasha Cummings on 2/7/25.
//

import UIKit

class MiddleViewController: UIViewController {

    @IBOutlet weak var MiddleLabel: UILabel!
    var eventNumber: Int = 1
    
    func addEvent(from: String) {
        if let existingText = MiddleLabel.text {
            MiddleLabel.text = "\(existingText) in event number \(eventNumber) was \(from)"
            eventNumber += 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addEvent(from: "viewDidLoad")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        print("View will appear!")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("View did appear!")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("View will disappear!")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("View did disappear!")
    }

}
