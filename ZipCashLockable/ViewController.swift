//
//  ViewController.swift
//  ZipCashLockable
//
//  Created by Oliver Körber on 13/06/15.
//  Copyright (c) 2015 Oliver Körber. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var zipCodeField: UITextField!
    @IBOutlet weak var cashTextField: UITextField!
    @IBOutlet weak var lockableTextField: UITextField!
    @IBOutlet weak var lockToggle: UISwitch!
    
    let zipTextFieldDelegate = ZipTextViewDelegate()
    let cashTextFieldDelegate = DollarTextDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.zipCodeField.delegate = zipTextFieldDelegate
    
        self.cashTextField.text = "$0.00"
        self.cashTextField.delegate = cashTextFieldDelegate
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func switchToggled(sender: UISwitch) {
        lockableTextField.enabled = sender.on
    }

}

