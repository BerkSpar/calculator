//
//  ViewController.swift
//  aula2
//
//  Created by Felipe Passos on 03/09/22.
//

import UIKit

extension String {
    var floatValue: Float {
        let result = self.replacingOccurrences(of: ",", with: ".")
        return (result as NSString).floatValue
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    var currentValue: String = ""
    var resultValue: Float = 0.0
    var operatorValue: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
    }

    @IBAction func onTapNumber(_ sender: UIButton) {
        currentValue += sender.titleLabel?.text ?? ""
        
        updateLabel()
    }
    
    func updateLabel() {
        if (currentValue.isEmpty) {
            resultLabel.text = "\(resultValue)".replacingOccurrences(of: ".", with: ",")
        } else {
            resultLabel.text = currentValue
        }
        
        operatorLabel.text = operatorValue
    }
    
    @IBAction func onOperatorClick(_ sender: UIButton) {
        if (operatorValue.isEmpty) {
            resultValue += currentValue.floatValue
        }
        
        operatorValue = sender.titleLabel?.text ?? ""
        
        currentValue = ""
        
        updateLabel()
    }
    
    @IBAction func onCalculate(_ sender: Any) {
        switch operatorValue {
            case "/":
                resultValue /= currentValue.floatValue
            case "+":
                resultValue += currentValue.floatValue
            case "-":
                resultValue -= currentValue.floatValue
            case "X":
                resultValue *= currentValue.floatValue
            default:
                resultValue += currentValue.floatValue
        }
        
        currentValue = ""
        
        updateLabel()
    }
    
    @IBAction func onReset(_ sender: Any) {
        currentValue = ""
        resultValue = 0.0
        operatorValue = ""
        
        updateLabel()
    }
    
}

