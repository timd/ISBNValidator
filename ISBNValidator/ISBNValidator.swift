//
//  ISBNValidator.swift
//  ISBNValidator
//
//  Created by Tim Ducket on 28.10.17.
//  Copyright © 2017 Tim Duckett. All rights reserved.
//

import Foundation

public func ISBNValidator(isbn: String) -> Bool {
    
    // remove spaces or dashes
    let cleanIsbn = cleanISBN(isbn: isbn)
    
    // reject long or short ISBNs
    if (cleanIsbn.count != 13) {
        return false
    }
    
    // Get check digit
    let lastIndex = isbn.index(before: cleanIsbn.endIndex)
    
    let checkDigit = Int(String(cleanIsbn[lastIndex]))
    
    let sum = calculateLongDigitSum(forISBN: cleanIsbn)
    
    let modulo = sum % 10
    
    let calculatedCheckDigit = 10 - modulo
        
    if checkDigit == calculatedCheckDigit {
        return true
    }
        
    return false
        
}

func cleanISBN(isbn: String) -> String {
    
    return isbn.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    
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
