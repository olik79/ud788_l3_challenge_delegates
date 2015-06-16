//
//  DollarTextDelegate.swift
//  ZipCashLockable
//
//  Created by Oliver Körber on 15/06/15.
//  Copyright (c) 2015 Oliver Körber. All rights reserved.
//

import UIKit

class DollarTextDelegate: NSObject, UITextFieldDelegate {
    let numberFormatter = NSNumberFormatter()
    
    var currentNumberTimesHundred = 0
    var nextDigitPosition = 0
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        // if we are deleting and there are digits left to delete
        if string.isEmpty && nextDigitPosition > 0 {
            currentNumberTimesHundred = Int(currentNumberTimesHundred / 10)
            nextDigitPosition = max(nextDigitPosition--, 0)
            
        } else if let newDigit = numberFormatter.numberFromString(string) {
            currentNumberTimesHundred =
                (currentNumberTimesHundred * 10) + newDigit.integerValue
            nextDigitPosition++
        }
        
        textField.text = String(format: "$%.2f", Double(currentNumberTimesHundred) / 100)
        return false
    }
}
