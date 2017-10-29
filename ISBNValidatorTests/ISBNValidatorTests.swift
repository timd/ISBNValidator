//
//  ISBNValidatorTests.swift
//  ISBNValidatorTests
//
//  Created by Tim Ducket on 28.10.17.
//  Copyright © 2017 Tim Duckett. All rights reserved.
//

import Quick
import Nimble

@testable import ISBNValidator

class ISBNValidatorTests: QuickSpec {
    
    override func spec() {
        
        describe("Validator") {
        }
        
        describe("When handling ISBN-13") {

            it("should return false when ISBN is less than 13 digits", closure: {
                let result = ISBNValidator(isbn: "1234567890")
                expect(result).to(beFalse())
            })

            it("should return false when ISBN is more than 13 digits", closure: {
                let result = ISBNValidator(isbn: "123456789012345")
                expect(result).to(beFalse())
            })

            it("should return true when ISBN is valid 13", closure: {
                let result = ISBNValidator(isbn: "9780547928227")
                expect(result).to(beTrue())
            })
            
            it("should return false when ISBN is invalid 13", closure: {
                let result = ISBNValidator(isbn: "9780547928226")
                expect(result).to(beFalse())
            })
            
        }

        describe("conversion") {
            
            it("should calculate checkdigits correctly for ISBN-13s", closure: {
                let isbn = "9780547928227"
                let expectedCheckDigit = "7"
                let receivedCheckDigit = calculateCheckDigit(forISBN: isbn)
                expect(receivedCheckDigit).to(equal(expectedCheckDigit))
            })

        }
        
        describe("ISBN cleaning") {
            
            it("should remove dashes from the ISBN", closure: {
                let startISBN = "978-0547928227"
                let cleanedISBN = cleanISBN(isbn: startISBN)
                expect(cleanedISBN).to(equal("9780547928227"))
            })
            
            it("should remove spaces from the ISBN", closure: {
                let startISBN = "978 0547928227 "
                let cleanedISBN = cleanISBN(isbn: startISBN)
                expect(cleanedISBN).to(equal("9780547928227"))
            })
            
            it("should remove non-decimal characters from the ISBN", closure: {
                let startISBN = "978A0547928227B"
                let cleanedISBN = cleanISBN(isbn: startISBN)
                expect(cleanedISBN).to(equal("9780547928227"))
            })
            
        }
        
        describe("internal calculations") {
            
            it("should calculate the long internal sum correctly", closure: {
                
                //     9     7     8     0     5     4     7     9     2     8     2     2
                //     0     o     e     o     e     o     e     o     e     o     e     o
                // s = 9×1 + 7×3 + 8×1 + 0×3 + 5×1 + 4×3 + 7×1 + 9×3 + 2×1 + 8×3 + 2×1 + 2×3
                //     9     21    8     0     5     12    7     27    2     24    2     6   = 123
                
                let fullISBN = "9780547928227"
                expect(calculateLongDigitSum(forISBN: fullISBN)).to(equal(123))
                
            })

        }
        
    }
}
