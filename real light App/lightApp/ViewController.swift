//
//  ViewController.swift
//  lightApp
//
//  Created by Sasha Cummings on 1/21/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    var lightOn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    fileprivate func updateUI() {
        if lightOn {
            view.backgroundColor = .white
            lightButton.setTitle("Off", for: .normal)
        } else {
            
            view.backgroundColor = .black
            lightButton.setTitle("On", for: .normal)
        }
    }
        @IBAction func ButtonPressed(_ sender: Any) {
            lightOn.toggle()
            updateUI()
    }
}

