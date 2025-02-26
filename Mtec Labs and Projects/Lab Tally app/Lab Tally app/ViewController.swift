//
//  ViewController.swift
//  Lab Tally app
//
//  Created by Sasha Cummings on 2/19/25.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 0
    var sumNum = 0

    @IBOutlet var numberTickerLabel: UILabel!
    
    @IBOutlet var slider: UISlider!
    
    @IBOutlet var printLabel: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateNumberTickerLabel()
}

   
    @IBAction func sliderChanged(_ sender: UISlider) {
//        count = Int(sender.value)
//        updateNumberTickerLabel()
    }
    
    func updateNumberTickerLabel() {
        numberTickerLabel.text = "\(count)"
    }
    
    @IBAction func dontTouchButtonTapped(_ sender: UIButton) {
        sumNum = count
        sumNum += 1
        count += Int(slider.value)
// is updating the numberTickerLable by 1 every time the doNotPressButtonTapped is pressed.
        numberTickerLabel.text = "\(sumNum)"
                
        switch sumNum {// is updating the PrintLable when it passes each condistion in the switch statment.
                    
        case 1...10:
            printLabel.text = "WHAT ARE YOU DOING!"
                    
        case 11...20:
            printLabel.text = "STOP IT! GO BACK!"
                    
        case 21...30:
            printLabel.text = "NO! STOP!"
                    
        default:
            printLabel.text = "what ever... >:C "
        }
    }
}

