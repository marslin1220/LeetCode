//: [Previous](@previous)

import XCTest

//12. Integer to Roman
//https://leetcode.com/problems/integer-to-roman/

//Runtime: 32 ms, faster than 26.80% of Swift online submissions for Integer to Roman.
//Memory Usage: 14 MB, less than 64.00% of Swift online submissions for Integer to Roman.

class Solution {
    func intToRoman(_ num: Int) -> String {
        var result = ""
        var intArray = [Int]()
        var numCopy = num
        while numCopy != 0 {
            intArray.append(numCopy % 10)
            numCopy /= 10
        }
        intArray = intArray.reversed()

        for (index, current) in intArray.enumerated() {
            let currentSymbol: String
            let level = intArray.count - index
            switch current {
            case 0:
                continue
            case 1:
                switch level {
                case 1:
                    currentSymbol = "I"
                case 2:
                    currentSymbol = "X"
                case 3:
                    currentSymbol = "C"
                case 4:
                    currentSymbol = "M"
                default:
                    currentSymbol = ""
                }
            case 2:
                switch level {
                case 1:
                    currentSymbol = "II"
                case 2:
                    currentSymbol = "XX"
                case 3:
                    currentSymbol = "CC"
                case 4:
                    currentSymbol = "MM"
                default:
                    currentSymbol = ""
                }
            case 3:
                switch level {
                case 1:
                    currentSymbol = "III"
                case 2:
                    currentSymbol = "XXX"
                case 3:
                    currentSymbol = "CCC"
                case 4:
                    currentSymbol = "MMM"
                default:
                    currentSymbol = ""
                }
            case 4:
                switch level {
                case 1:
                    currentSymbol = "IV"
                case 2:
                    currentSymbol = "XL"
                case 3:
                    currentSymbol = "CD"
                default:
                    currentSymbol = ""
                }
            case 5:
                switch level {
                case 1:
                    currentSymbol = "V"
                case 2:
                    currentSymbol = "L"
                case 3:
                    currentSymbol = "D"
                default:
                    currentSymbol = ""
                }
            case 6:
                switch level {
                case 1:
                    currentSymbol = "VI"
                case 2:
                    currentSymbol = "LX"
                case 3:
                    currentSymbol = "DC"
                default:
                    currentSymbol = ""
                }
            case 7:
                switch level {
                case 1:
                    currentSymbol = "VII"
                case 2:
                    currentSymbol = "LXX"
                case 3:
                    currentSymbol = "DCC"
                default:
                    currentSymbol = ""
                }
            case 8:
                switch level {
                case 1:
                    currentSymbol = "VIII"
                case 2:
                    currentSymbol = "LXXX"
                case 3:
                    currentSymbol = "DCCC"
                default:
                    currentSymbol = ""
                }
            case 9:
                switch level {
                case 1:
                    currentSymbol = "IX"
                case 2:
                    currentSymbol = "XC"
                case 3:
                    currentSymbol = "CM"
                default:
                    currentSymbol = ""
                }
            default:
                currentSymbol = ""
            }

            result += currentSymbol
        }

        return result
    }
}

class MyTests : XCTestCase {
    let solution = Solution()

    func test1() {
        XCTAssertEqual(solution.intToRoman(3), "III")
    }

    func test2() {
        XCTAssertEqual(solution.intToRoman(4), "IV")
    }

    func test3() {
        XCTAssertEqual(solution.intToRoman(9), "IX")
    }

    func test4() {
        XCTAssertEqual(solution.intToRoman(58), "LVIII")
    }

    func test5() {
        XCTAssertEqual(solution.intToRoman(1994), "MCMXCIV")
    }
}

TestRunner().runTests(testClass: MyTests.self)

//: [Next](@next)
