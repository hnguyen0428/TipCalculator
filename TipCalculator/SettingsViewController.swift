//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Hoang on 12/26/17.
//  Copyright © 2017 Hoang. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController, UINavigationControllerDelegate {
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var valueChanged: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if viewController is ViewController {
            let controller = viewController as! ViewController
            controller.valueChanged = self.valueChanged
            controller.updateSegmentedControl()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        let index = UserDefaults.standard.object(forKey: "tip_index") as? Int
        if let index = index {
            segmentedControl.selectedSegmentIndex = index
        }
    }
    
    @IBAction func saveTipPercentage(_ sender: Any) {
        let index = segmentedControl.selectedSegmentIndex
        UserDefaults.standard.set(index, forKey: "tip_index")
        UserDefaults.standard.synchronize()
        valueChanged = true
    }
    
}
