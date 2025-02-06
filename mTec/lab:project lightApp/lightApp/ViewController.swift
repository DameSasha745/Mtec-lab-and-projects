//
//  ViewController.swift
//  lightApp
//
//  Created by Sasha Cummings on 1/21/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lightButton: UIButton!
    
    
    var lightOn = true
    
    //--------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //---------------------------
    
    fileprivate func updateUI() {
        view.backgroundColor = lightOn ? .white : .black
    }
        @IBAction func ButtonPressed(_ sender: Any) {
            lightOn.toggle()
            updateUI()
        }
    }
