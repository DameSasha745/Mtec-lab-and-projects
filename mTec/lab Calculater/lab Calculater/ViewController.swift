//
//  ViewController.swift
//  lab Calculater
//
//  Created by Sasha Cummings on 2/6/25.
//

import UIKit

class ViewController: UIViewController {
    enum Operator: String {
        case addition = "+"
        case subtraction = "-"
        case multiplication = "x"
        case division = "÷"
    }
    
    @IBOutlet var textLabel: UILabel!
    
    var currentText: String = ""
    var previousText: String = ""
    var currentOP: Operator?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = "0"
    }
    
    @IBAction func numberTyped(_ sender: UIButton) {
        guard let senderButton = sender.titleLabel?.text else { return }
    
    
            switch senderButton {

                
            case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
                currentText += senderButton
                textLabel.text = currentText
                

            case "÷", "x", "+", "-":
                guard let newOperator = Operator(rawValue: senderButton) else { return }
                if !currentText.isEmpty {
                    previousText = currentText
                    currentText = ""
                }
                currentOP = newOperator
                textLabel.text = currentText
                
            case ".":
                if !currentText.contains(".") {
                    currentText += "."
                    textLabel.text = currentText
                }
                
            case "=":
                if let localCurrentOperator = currentOP, !previousText.isEmpty, !currentText.isEmpty {
                    let total = caluculateResult()
                    textLabel.text = "\(total)"
                    previousText = "\(total)"
                    currentText = ""
                    currentOP = nil
                }
            case "AC":
                currentText = ""
                previousText = ""
                currentOP = nil
                textLabel.text = "0"
                
                
            default:
                break
                
            }
        }
        func caluculateResult() -> Double {
            guard let operatorSymbol = currentOP, let previous = Double(previousText), let current = Double(currentText) else {
                return 0
            }
            
            switch operatorSymbol {
            case .addition:
                return previous + current
            case .subtraction:
                return previous - current
            case .multiplication:
                return previous * current
            case .division:
                return previous / current
        }
    }
    
}
