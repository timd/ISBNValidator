# ISBNValidator

Being a small Swift framework for validating ISBN-13 numbers.

# Installation

Carthage:

1. Add `github "timd/ISBNValidator" "master"` to the Cartfile
1. Run `carthage update`
1. Add the framework to the `Link Binary with Libraries` build phase, and add to the Carthage `Run Script` build phase as per the Carthage documentation.

Cocoapods:

Not yet.

# Usage

1. Import the framework into the class: `import ISBNValidator`
1. Call the `ISBNValidator`:
```
        let validIsbn = "9780547928227"
        let validResult = ISBNValidator(isbn: validIsbn)
        print(validResult) // prints 'true'

        let invalidIsbn = "9780547928228"
        let invalidResult = ISBNValidator(isbn: invalidIsbn)
        print(invalidResult)  // prints 'false'
```



