//
//  ViewController.swift
//  lab4
//
//  Created by Blythe Waltman on 9/29/20.
//  Copyright © 2020 Blythe Waltman. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var baseValue: UITextField!
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var powerStepper: UIStepper!
    @IBOutlet weak var valueLabel: UILabel!
    
    
    
    @IBAction func updatePower(_ sender: Any) {
        if powerStepper.value == 1 {
            powerLabel.text = "Power 1"
        }
        else{
            powerLabel.text = "Power " + String(format:"%.0f", powerStepper.value)
        }
        updateValue()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func updateValue(){
        var amount:Int
        let power = Int(powerStepper.value)
        let y = power - 1
        
        
        if(power < 11){
            
            if baseValue.text!.isEmpty{
                amount = 0
            }else if power == 1{
               amount = Int(baseValue.text!)!
            }else{
                amount = Int(baseValue.text!)!
                let base = Int(baseValue.text!)!
                for _ in 1...(y){
                    amount = amount * base
                }
            }
            valueLabel.text = String(amount)
        }
        else{
            //create a UIAlertController object
            let alert = UIAlertController(title: "Warning", message: "Power must be less than or equal to 10", preferredStyle: UIAlertController.Style.alert)
            //create a UIAlertAction object for the button
            let cancelAction = UIAlertAction(title: "Cancel", style:UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(cancelAction)
            let okAction = UIAlertAction(title: "OK" , style: UIAlertAction.Style.default, handler: {action in self.powerStepper.value = 10
                self.powerLabel.text? = "Power 10"
                self.updateValue()
            })
            alert.addAction(okAction)
            present(alert, animated: true, completion:nil)
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateValue()
    }

    override func viewDidLoad() {
        baseValue.delegate = self
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}

