//
//  ZipTextViewDelegate.swift
//  ZipCashLockable
//
//  Created by Oliver Körber on 13/06/15.
//  Copyright (c) 2015 Oliver Körber. All rights reserved.
//

import UIKit

class ZipTextViewDelegate: NSObject, UITextFieldDelegate {
    let numberFormatter = NSNumberFormatter()
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        if string.isEmpty {
            return true
        } else if let newDigit = numberFormatter.numberFromString(string) {
            var newString: NSString = textField.text
            newString = newString.stringByReplacingCharactersInRange(range, withString: string)
            
            return (newString.length <= 5)
        } else {
            return false
        }
    }
}
