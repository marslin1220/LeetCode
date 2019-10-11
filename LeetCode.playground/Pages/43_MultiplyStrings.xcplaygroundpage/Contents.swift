//: [Previous](@previous)

//43. Multiply Strings
//Q: https://leetcode.com/problems/multiply-strings/submissions/

import Foundation

import XCTest

class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {
        if num1 == "0" || num2 == "0" {
            return "0"
        }

        var resultIndex: Int = 0
        var result = ""
        var carry = 0
        let num1Array = Array(num1.reversed())
        let num2Array = Array(num2.reversed())

        while true {
            var currentResult = carry
            carry = 0

            for (num2Index, num2Char) in num2Array.enumerated() {
                let num1Index = resultIndex - num2Index

                if num1Index < 0 || num1Index >= num1Array.count {
                    continue
                }

                let num1Int = Int(num1Array[num1Index].asciiValue ?? 0) - 48
                let num2Int = Int(num2Char.asciiValue ?? 0) - 48
                currentResult += num1Int * num2Int
            }

            carry += Int(currentResult / 10)
            currentResult = currentResult % 10
            resultIndex += 1
            result.append(String(currentResult))

            if resultIndex - num2Array.count >= num1Array.count - 1 {
                if carry > 0 {
                    result.append(String(carry))
                }

                break
            }
        }

        return String(result.reversed())
    }
}

class MyTests : XCTestCase {
    func test1() {
        XCTAssertEqual(Solution().multiply("123", "456"), "56088")
    }

    func test2() {
        XCTAssertEqual(Solution().multiply("9", "9"), "81")
    }

    func test3() {
        XCTAssertEqual(Solution().multiply("1234", "0"), "0")
    }
}

TestRunner().runTests(testClass: MyTests.self)

//: [Next](@next)
