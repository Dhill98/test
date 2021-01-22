//
//  ViewController.swift
//  Prework
//
//  Created by Daniel Astudillo on 1/14/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var sliderRate: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
// alternative method for making keyboard disappear: a little more complicated.
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        view.endEditing(true)
//        super.touchesBegan(touches, with: event)
//    }

    @IBAction func setRate(_ sender: Any) {
        sliderRate.text = String(format: "%.2f",tipSlider.value) + "%"
        sliderRate.sizeToFit()
        let bill = Double(billAmountTextField.text!) ?? 0
        let tip = bill * Double(tipSlider.value / 100)
        tipAmount.text = String(format: "$%.2f",tip)
        let newTotal = bill + tip
        totalAmount.text = String(format: "$%.2f",newTotal)
        tipAmount.sizeToFit()
        totalAmount.sizeToFit()
        
    }
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [0.15,0.18,0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        
        let total = bill + tip
        tipAmount.text = String(format: "$%.2f",tip)
        sliderRate.text = String(format: "%.2f",tipPercentages[tipControl.selectedSegmentIndex] * 100) + "%"
        sliderRate.sizeToFit()
        totalAmount.text = String(format: "$%.2f",total)
        tipAmount.sizeToFit()
        totalAmount.sizeToFit()
        
    }
    

}

