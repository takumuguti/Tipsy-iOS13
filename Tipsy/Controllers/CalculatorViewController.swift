//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var billTextField: UITextField!
    
    var currentTip: Double = 0
    var split: Double = 2.0
    var totalBill: Double = 0
    var amountPerPerson: Double = 0
    var tipString = "0%"
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        unselectAll()
        sender.isSelected = true
        tipString = sender.currentTitle!
        if sender.currentTitle == "0%" {
            currentTip = 0
        } else if sender.currentTitle == "10%"{
            currentTip = 0.1
        }
        else {
            currentTip = 0.2
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        split = sender.value
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let amountString = billTextField.text ?? "0"
        let bill = Double(amountString) ?? 0
       
        totalBill = bill + bill*currentTip
        amountPerPerson = totalBill / split
        
    
        performSegue(withIdentifier: "goToResults", sender: self)
        
    }
    
    func unselectAll(){
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let resultsVC = segue.destination as! ResultsViewController
            resultsVC.amountPerPerson = amountPerPerson
            resultsVC.settings = buildSettingsString()
        }
    }
    
    func buildSettingsString() -> String {
        let splitString = String(format: "%.0f", split)
        return "Split between \(splitString) people, with \(tipString) tip."
    }
}

