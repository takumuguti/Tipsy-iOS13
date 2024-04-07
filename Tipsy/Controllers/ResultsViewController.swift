//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Takudzwanashe Muguti on 2024/04/03.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    var settings: String?
    var amountPerPerson: Double?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let total = amountPerPerson {
            totalLabel.text = "$\(String(format: "%.2f", total))"
        }
        if let settings = settings {
            settingsLabel.text = settings
        }
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }

}
