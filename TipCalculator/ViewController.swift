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
    
    var valueChanged: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSegmentedControl()
        priceField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateSegmentedControl() {
        let index = UserDefaults.standard.object(forKey: "tip_index") as? Int
        
        if let index = index {
            // Only change the segmented control if the value was changed in
            // the settings page
            print(valueChanged)
            if valueChanged {
                segmentedControl.selectedSegmentIndex = index
            }
        }
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
    
    func saveState() {
        UserDefaults.standard.set(tipLabel.text!, forKey: "tip_amount")
        UserDefaults.standard.set(totalLabel.text!, forKey: "total_amount")
        if let bill = priceField.text {
            UserDefaults.standard.set(bill, forKey: "bill_amount")
        }
        
        UserDefaults.standard.set(NSDate(), forKey: "closed_time")
    }
    
    func resetState() {
        let bill = UserDefaults.standard.object(forKey: "bill_amount") as? String
        let total = UserDefaults.standard.object(forKey: "total_amount") as? String
        let tip = UserDefaults.standard.object(forKey: "tip_amount") as? String
        
        priceField.text = bill
        totalLabel.text = total
        tipLabel.text = tip
    }
}

