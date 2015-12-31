//
//  ViewController.swift
//  tips
//
//  Created by Michael Gonzales on 12/30/15.
//  Copyright © 2015 MkGo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var outputView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        outputView.alpha = 0
        tipControl.alpha = 0
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEdit(sender: AnyObject) {
        
        
        var tipPercentages = [0.18, 0.2, 0.22]
        let tipP = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipP
        let total = billAmount + tip
        
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        if (billField.text != ""){
            UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                self.tipControl.alpha = 1.0
                self.outputView.alpha = 1.0
                }, completion: nil)
            
        }
        else {
            UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {self.tipControl.alpha = 0.0
                self.outputView.alpha = 0.0
                }, completion: nil)
            
        }
        
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

