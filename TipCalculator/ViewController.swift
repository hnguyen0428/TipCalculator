//
//  ViewController.swift
//  TipCalculator
//
//  Created by Hoang on 12/26/17.
//  Copyright © 2017 Hoang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var priceField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func endEditing(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        if let text = priceField.text {
            let tipPercentages = [0.18, 0.20, 0.25]
            let index = segmentedControl.selectedSegmentIndex
            let tipPercent = tipPercentages[index]
            
            let price = Double(text) ?? 0
            let tip = price * tipPercent
            let total = price + tip
            
            tipLabel.text = String.init(format: "$%.2f", tip)
            totalLabel.text = String.init(format: "$%.2f", total)
        }
    }
}

