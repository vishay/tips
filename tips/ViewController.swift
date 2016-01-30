//
//  ViewController.swift
//  tips
//
//  Created by Vishay Nihalani on 1/24/16.
//  Copyright © 2016 Vishay Nihalani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!

    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var amountForOneLabel: UILabel!
    @IBOutlet weak var amountForTwoLabel: UILabel!
    @IBOutlet weak var amountForThreeLabel: UILabel!
    @IBOutlet weak var amountForFourLabel: UILabel!
    
    var initialPosTopView: CGFloat!
    var initialPosBottomView: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
     
        initialPosTopView = topView.center.y
        initialPosBottomView = bottomView.center.y
        
        billAmountTextField.becomeFirstResponder()
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
            
        if (billAmountTextField.text == "") {

            UIView.animateWithDuration(0.5, animations: {
                self.topView.center.y = self.initialPosTopView
                self.tipControl.alpha = 0
                
                self.bottomView.center.y = self.initialPosBottomView
                self.bottomView.alpha = 0
            })
        } else {
            
            UIView.animateWithDuration(0.5, animations: {
                self.topView.center.y = self.initialPosTopView - 145
                self.tipControl.alpha = 1
                
                self.bottomView.center.y = self.initialPosBottomView - 145
                self.bottomView.alpha = 1
            })
        }
        
        self.updateLabels()
    }
    
    func updateLabels() {
        
        var tipPercentages = [0.18, 0.20, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = NSString(string: billAmountTextField.text!).doubleValue
        
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        

        // Commenting out the following 4 lines makes the animation work, but prevents the label from updating
        tipLabel.text = "$/(tip)"
        amountForOneLabel.text = "$/(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        amountForOneLabel.text = String(format: "$%.2f", total)
        amountForTwoLabel.text = String(format: "$%.2f", total/2.0)
        amountForThreeLabel.text = String(format: "$%.2f", total/3.0)
        amountForFourLabel.text = String(format: "$%.2f", total/4.0)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        
        billAmountTextField.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

