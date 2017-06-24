//: Playground - noun: a place where people can play

import UIKit

// FUNCTIONS!
func printGreeting(){
    print("Hello, playground.")
}

printGreeting()

// using a parameter
//func printPersonalGreeting(name: String){
//    print("Hello \(name), welcome to your playground.")
//}

//printPersonalGreeting(name: "Matt")

// function with multiple parameters
// all parameter names are used by default when you call a function
//func divisionDescriptionFor (numerator: Double, denominator: Double){
//    print("\(numerator) divided by \(denominator) equals \(numerator / denominator)")
//}
//
//divisionDescriptionFor(numerator: 9.0, denominator: 3.0)

// "to" is an external parameter.  
// helps make code more readable
func printPersonalGreeting(to name: String){
    print("Hello \(name), welcome to your playground.")
}
printPersonalGreeting(to: "Matt")

// swift naming guidelines suggest that if a function has multiple parameters that formulate a single concept the preposition should be placed at the end of the function name (such as "divisionDescriptionFor" instead of "printPersonalGreeting(to name:)"

// variadic parameters - takes zero or more input values for its argument, a function can only have one variadic parameter and it typically is the last parameter.  values provided are made available in the function as an array
func printPersonalGreetings(to names: String...){
    for name in names{
        print ("Hello \(name), welcome to the playground.")
    }
}
printPersonalGreetings(to: "Alex", "Chris", "Drew", "Pat")

// default parameter values
// place default parameter values at the end of a function's parameter list
// if default parameter has a value,you can omit that argument when calling the function and it will be used as the default value
//func divisionDescriptionFor (numerator: Double, denominator: Double, withPunctuation punctuation: String = "."){
//    print("\(numerator) divided by \(denominator) equals \(numerator / denominator)\(punctuation)")
//}
//
//divisionDescriptionFor(numerator: 9.0, denominator: 3.0)
//divisionDescriptionFor(numerator: 9.0, denominator: 3.0, withPunctuation:"!")

//in-out parameters
// in-out parameters allow a function's impact on a variable to live beyond the function's body.  
// in-out parameters can't have default values
// variadic parameters can't be parked with inout
var error = "The request failed:"
func appendErrorCode(_ code: Int, toErrorString errorString: inout String){
    if code == 400 {
        errorString += " bad request"
    }
}
appendErrorCode (400, toErrorString: &error)
error
// inout parameters are not the same thing as returning a value
// using _ as an external name will suppress the external name when calling the function
// in above example, you only write 400 as the first parameter, not _ code: 400 or code: 400


// returning from a function
func divisionDescriptionFor (numerator: Double, denominator: Double, withPunctuation punctuation: String = ".") -> String {
    return ("\(numerator) divided by \(denominator) equals \(numerator / denominator)\(punctuation)")
}
print(divisionDescriptionFor(numerator: 9.0, denominator: 3.0, withPunctuation: "!"))
// print expects to take a String argument, so because you are returning a String, you can call the function with the print function and it will log the string to the console

// nested functions and scope - scope is same concept as with javascript
func areaOfTriangleWith(base: Double, height: Double) -> Double {
    let numerator = base * height
    func divide() -> Double {
        return numerator / 2
    }
    return divide()
}

areaOfTriangleWith(base: 3.0, height: 5.0)

// multiple returns
func sortedEvenOddNumbers (_ numbers: [Int]) -> (evens: [Int], odds: [Int]){
    var evens = [Int]()
    var odds = [Int]()
    for number in numbers {
        if number % 2 == 0 {
            evens.append(number)
        } else {
            odds.append(number)
        }
    }
    return (evens,odds)
}

let aBunchOfNumbers = [10,1,4,3,57,43,84,27,156,111]
let theSortedNumbers = sortedEvenOddNumbers(aBunchOfNumbers)
print("The even numbers are: \(theSortedNumbers.evens); the odd numbers are: \(theSortedNumbers.odds)")

// optional return types
func grabMiddleName (fromFullName name: (String, String?, String)) -> String? {
    return name.1
}

let middleName = grabMiddleName(fromFullName: ("Matt", nil, "Matthias"))
if let theName = middleName {
    print(theName)
}
// because middle name is nil, the boolean used in optional binding does not evaluate to true so print is not executed

// exiting early from a function
// guard statements
//execute code depending on a boolean value from some expression
//guard statement is used to exit early from a function if some condition is not met (protects code from running under improper conditions--hence the name guard)
//func greetByMiddleName (fromFullName name: (first: String, middle: String?, last: String)) {
//    guard let middleName = name.middle else {
//        print ("Hey there!")
//        return
//    }
//    print("Hey \(middleName)")
//}
//
//greetByMiddleName(fromFullName: ("Matt", "Danger", "Matthias"))
// must explicitly return from the function after the guard statement's body--this shows the condition estabished by the guard statement was not met and the function needs to return early

// function types
//function types are made up of the function's parameter and return types
// for example: function with no arguments and no return has type () -> ()
// example: sortedEvenOddNumbers(_:) has type: ([Int]) -> ([Int],[Int]) AKA a function with one parameter takes an array of integers and returns a typle with two arrays containing integers
// this becomes important/significant because you can use functions in arguments and returns of other functions



