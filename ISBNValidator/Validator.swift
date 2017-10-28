//
//  ISBNValidator.swift
//  ISBNValidator
//
//  Created by Tim Ducket on 28.10.17.
//  Copyright © 2017 Tim Duckett. All rights reserved.
//

import Foundation

public func ISBNValidator(isbn: String) -> Bool {
    
    // reject long or short ISBNs
    if (isbn.count != 13) {
        return false
    }
    
    // Get check digit
    let lastIndex = isbn.index(before: isbn.endIndex)
    
    let checkDigit = Int(String(isbn[lastIndex]))
    
    let sum = calculateLongDigitSum(forISBN: isbn)
    
    let modulo = sum % 10
    
    let calculatedCheckDigit = 10 - modulo
        
    if checkDigit == calculatedCheckDigit {
        return true
    }
        
    return false
        
}

func calculateLongDigitSum(forISBN: String) -> Int {
    
    let workingISBN = String(forISBN.dropLast())
    
    var runningSum = 0
    
    for index in 0...(workingISBN.count-1) {
        
        let thisIndex = workingISBN.index(workingISBN.startIndex, offsetBy: index)
        let theChar = workingISBN[thisIndex]
        
        let charIntValue = Int(String(theChar))!
        
        if index == 0 {
            runningSum += charIntValue
        } else if index % 2 == 0 {
            // Even, no change
            runningSum += charIntValue
        } else {
            // Odd, x 3
            runningSum += (charIntValue * 3)
        }
        
    }
        
    return runningSum
    
}
