//
//  ViewController.swift
//  controls in action
//
//  Created by Sasha Cummings on 1/28/25.
//

import UIKit

class ViewController: UIViewController {

    let colors: [UIColor] = [.red, .green, .orange, .purple, .black]
    
    
    @IBOutlet var randomColorButton: UIButton!
    
    @IBOutlet weak var switchColor: UISwitch!
    
    
    @IBOutlet weak var sliderColor: UISlider!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func colorTapped(_ sender: Any) {
        
        let randomColor = colors.randomElement()
        
        self.view.backgroundColor = randomColor
        
    }
    
    @IBAction func switchTapped(_ sender: UISwitch) {
        
        self.randomColorButton.isHidden = !sender.isOn
        self.sliderColor.isHidden = !sender.isOn
        
        
    }
    
    @IBAction func sliderToggled(_ sender: UISlider) {
        
        self.view.alpha = CGFloat(sender.value)
        
  
    }
    
    @IBAction func textFieldTriggered(_ sender: UITextField) {
        self.textLabel.text = sender.text
        sender.text = nil
    }
    
    @IBAction func didTapHappen(_ sender: UITapGestureRecognizer) {
        
        print("user did tap")
        
        let randomColor = colors.randomElement()
        
        self.view.backgroundColor = randomColor
    }
}
