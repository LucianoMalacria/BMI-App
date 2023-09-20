//
//  ViewController.swift
//  Bmi App
//
//  Created by Luciano on 2023-09-19.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtHeight: UITextField!
    
    @IBOutlet weak var txtWeight: UITextField!
    
    @IBOutlet weak var lblShowBmi: UILabel!
    
    @IBAction func btnCalculateTouchUpInside(_ sender: Any) {
        
        var heightInMeterSq = 0.00
        
        if let height = Double(txtHeight.text!) {
            
            if height >= 80 && height <= 250 {
                
                let heightInMeters = (height / 100)
                
                heightInMeterSq = heightInMeters * heightInMeters
                
            }
            
            else {
                
                Toast.ok(view: self, title: "Review the height!", message: "Please, enter a valid height in cm between 80 and 250.")
            }
            
        }
        
        if let weight = Double(txtWeight.text!) {
            
            if weight >= 30 && weight <= 300 {
                
                let bmi = weight / heightInMeterSq
                
                if bmi < 18.5 {
                    
                    lblShowBmi.text = "BMI Classification = Underweight"
                    lblShowBmi.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
                    lblShowBmi.isHidden = false
                    
                }
                
                else if bmi >= 18.5 && bmi < 25{
                    
                    lblShowBmi.text = "BMI Classification = Normal Weight"
                    lblShowBmi.backgroundColor = UIColor.green.withAlphaComponent(0.5)
                    lblShowBmi.isHidden = false
                    
                }
                
                else if bmi >= 25 && bmi < 30 {
                    
                    lblShowBmi.text = "BMI Classification = Overweight"
                    lblShowBmi.backgroundColor = UIColor.yellow.withAlphaComponent(0.5)
                    lblShowBmi.isHidden = false
                    
                }
                
                else {
                    
                    lblShowBmi.text = "BMI Classification = Obese"
                    lblShowBmi.backgroundColor = UIColor.orange.withAlphaComponent(0.5)
                    lblShowBmi.isHidden = false
                    
                }
                
            }
            
            else {
                
                Toast.ok(view: self, title: "Review the weight!", message: "Please, enter a weight in Kg between 30 and 300.")
            }
            
        }
        
        else{
            
            Toast.ok(view: self, title: "Oops!", message: "Please, enter a valid height or weight!")
            
        }
    }
    @IBAction func txtHeightEditingChanged(_ sender: Any) {
        
        lblShowBmi.isHidden = true
        
    }
    
    @IBAction func txtWeightEditingChanged(_ sender: Any) {
        
        lblShowBmi.isHidden = true
        
    }
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            lblShowBmi.isHidden = true
            
        }
}
