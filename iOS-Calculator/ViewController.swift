//
//  ViewController.swift
//  iOS-Calculator
//
//  Created by 阿栋 on 1/2/25.
//

import UIKit
import Calculate

class ViewController: UIViewController {
    
    @IBOutlet weak var result: UILabel!
    
    //MARK: - IBOutlets Buttons
    @IBOutlet weak var percentage: UIButton!
    @IBOutlet weak var changeSign: UIButton!
    @IBOutlet weak var ac: UIButton!
    @IBOutlet weak var division: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    @IBOutlet weak var multiplication: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var decimal: UIButton!
    @IBOutlet weak var equal: UIButton!
    @IBOutlet weak var sine: UIButton!
    @IBOutlet weak var cosine: UIButton!
    @IBOutlet weak var tangent: UIButton!
    @IBOutlet weak var DEL: UIButton!
    
    //MARK: - Custom Variables
    private var currentNumber: String = "0"
    private var previousNumber: Double = 0
    private var operation: String? = nil
    private var isTyping = false
    private var trigFunction: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetCalculator()
    }
    
    // MARK: - Button IBActions
    
    @IBAction func numberPressed(_ sender: UIButton) {
        guard let buttonTitle = sender.titleLabel?.text else { return }
        
        if isTyping {
            currentNumber += buttonTitle
        } else {
            currentNumber = buttonTitle
            isTyping = true
        }
        
        updateResultLabel()
    }
    
    @IBAction func operationPressed(_ sender: UIButton) {
        guard let buttonTitle = sender.titleLabel?.text else { return }
        
        if isTyping {
            previousNumber = Double(currentNumber) ?? 0
            isTyping = false
        }
        
        operation = buttonTitle
        currentNumber = "0"
    }
    
    @IBAction func trigFunctionPressed(_ sender: UIButton) {
        guard let buttonTitle = sender.titleLabel?.text else { return }
        trigFunction = buttonTitle
        isTyping = false
    }
    
    @IBAction func equalsPressed(_ sender: UIButton) {
        let current = Double(currentNumber) ?? 0
        var result: Double = 0
        
        // trig calculation operations
        if let trigFunction = trigFunction {
            switch trigFunction {
            case "sin":
                result = MathOperations.sine(current)
            case "cos":
                result = MathOperations.cosine(current)
            case "tan":
                result = MathOperations.tangent(current)
            default:
                return
            }
            self.trigFunction = nil
        } else if let operation = operation {
            // normal calculation operations
            switch operation {
            case "+":
                result = MathOperations.addition(previousNumber, with: current)
            case "-":
                result = MathOperations.subtraction(previousNumber, with: current)
            case "*":
                result = MathOperations.multiplication(previousNumber, with: current)
            case ":":
                if let divisionResult = MathOperations.division(previousNumber, with: current) {
                    result = divisionResult.doubleValue
                } else {
                    result = 0
                }
            default:
                return
            }
            previousNumber = result
            self.operation = nil
        }
        
        currentNumber = String(format: "%.2f", result)
        isTyping = false
        updateResultLabel()
    }
    
    @IBAction func deleteLastCharacter(_ sender: UIButton) {
        // delete last input
        if !currentNumber.isEmpty {
            currentNumber.removeLast()
        }
        if currentNumber.isEmpty {
            currentNumber = "0"
        } else if currentNumber == "0" {
            isTyping = false
        }
        updateResultLabel()
    }


    
    @IBAction func percentagePressed(_ sender: UIButton) {
        let number = Double(currentNumber) ?? 0
        currentNumber = String(number / 100)
        updateResultLabel()
    }
    
    @IBAction func changeSignPressed(_ sender: UIButton) {
        let number = Double(currentNumber) ?? 0
        currentNumber = String(-number)
        updateResultLabel()
    }
    
    @IBAction func acPressed(_ sender: UIButton) {
        resetCalculator()
    }
    
    @IBAction func decimalPressed(_ sender: UIButton) {
        if !currentNumber.contains(".") {
            currentNumber += "."
        }
        updateResultLabel()
    }
    
    // MARK: - Helper Methods
    
    private func resetCalculator() {
        currentNumber = "0"
        previousNumber = 0
        operation = nil
        trigFunction = nil
        isTyping = false
        updateResultLabel()
    }
    
    private func updateResultLabel() {
        result.text = currentNumber
    }
}


