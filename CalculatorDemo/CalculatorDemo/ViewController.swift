//
//  ViewController.swift
//  CalculatorDemo
//
//  Created by Yuvraj  Kale on 05/05/20.
//  Copyright © 2020 Yuvraj  Kale. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var firstValue:Double=0
    var lastValue :Double=0
    var performOperation = false
    var isnewOperationPerfromed = false
    var operationToPerform:Int=0
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstValue = 0
        // Do any additional setup after loading the view.
    }

    @IBAction func onClickAction(_ sender: Any) {
        if(isnewOperationPerfromed){
            performOperation = false
            resultLabel.text = ""
            firstValue = 0
            lastValue = 0
            operationToPerform = 0
            isnewOperationPerfromed = false
        }
        if let senderButton = sender as? UIButton{
            switch senderButton.tag {
            case 1,2,3,4,5,6,7,8,9:
                if(performOperation){
                    resultLabel.text = ""
                    resultLabel.text = resultLabel.text! + String(senderButton.tag)
                    performOperation = false
                }
                else{
                    if(resultLabel.text == "0"){
                        resultLabel.text = ""
                    }
                    resultLabel.text = resultLabel.text! + String(senderButton.tag)
                    
                }
                if let value = Double(resultLabel.text!){
                  firstValue = value
                }
                
            print("Hello")
                break;
            case 0:
                if(performOperation){
                    resultLabel.text = ""
                    resultLabel.text = resultLabel.text! + String(senderButton.tag)
                    performOperation = false
                }
                else if((resultLabel.text!.count > 0) && !(resultLabel.text == "0")){
                    resultLabel.text = resultLabel.text! + String(senderButton.tag)
                }
                else{
                    resultLabel.text = "0"
                }
                if let value = Double(resultLabel.text!){
                  firstValue = value
                }
            print("0")
                break;
            case 11,13,14,15,16,19:
                if(senderButton.tag == 11 || senderButton.tag == 13)
                {
                    if(senderButton.tag == 11){
                        resultLabel.text = "\(Double(resultLabel.text!)! / 100)"
                        isnewOperationPerfromed = true
                    }
                    else{
                        resultLabel.text = "\((Double(resultLabel.text!)! * Double(resultLabel.text!)!).removeZerosFromEnd())"
                        isnewOperationPerfromed = true
                    }
                }
                else{
                    if let text = resultLabel.text{
                        if let val = Double(text){
                            lastValue = val
                            performOperation = true
                            operationToPerform = senderButton.tag
                        }
                        else{
                            resultLabel.text = "0"
                        }
                    }
                    else{
                        resultLabel.text = "0"
                    }
                }
                
            print("Mod")
                break;
            case 12:
                resultLabel.text = "0"
                firstValue = 0
                performOperation = false
                firstValue = 0
                lastValue = 0
                operationToPerform = 0
                isnewOperationPerfromed = false

            print("Clear")
                break;
            case 17:
                isnewOperationPerfromed = true
                switch operationToPerform {
                    
                               case 14:
                                resultLabel.text = "\((lastValue / firstValue).removeZerosFromEnd())"
                               print("Devide")
                                break;
                               case 15:
                                resultLabel.text = "\((lastValue * firstValue).removeZerosFromEnd())"
                               print("Multiply")
                                break;
                               case 16:
                                resultLabel.text = "\((lastValue - firstValue).removeZerosFromEnd())"
                               print("Minus")
                                break;
                               case 19:
                                resultLabel.text = "\((lastValue + firstValue).removeZerosFromEnd())"
                               print("Add")
                                break;
                               default:
                                   resultLabel.text = "0";
                               }
//                resultLabel.text = "\(firstValue!)"
            print("Equal to")
                break;
            case 18:
                resultLabel.text = resultLabel.text! + "."
            print("Dot")
            default:
                resultLabel.text = "0"
                print("Default")
                break;
            }
        }
    }
    
}

extension Double {
    func removeZerosFromEnd() -> String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: self)
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 16 //maximum digits in Double after dot (maximum precision)
        return String(formatter.string(from: number) ?? "")
    }
}
