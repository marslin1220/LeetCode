//: [Previous](@previous)

// Question: https://leetcode.com/problems/letter-combinations-of-a-phone-number/

import XCTest

class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        if digits.count == 0 {
            return []
        }

        let phoneNumberLetters: [Character: String] = ["2": "abc", "3": "def", "4": "ghi", "5": "jkl", "6": "mno", "7": "pqrs", "8": "tuv", "9": "wxyz"]
        var result = [String]()

        var upperLayer = [""]

        // Build the tree
        for digit in digits {
            var currentLayer = [String]()

            for letter in phoneNumberLetters[digit]! {
                for combination in upperLayer {
                    currentLayer.append("\(combination)\(letter)")
                }
            }
            upperLayer = currentLayer
        }

        result = upperLayer

        return result
    }
}

class MyTests : XCTestCase {
    func test1() {
        XCTAssertEqual(Solution().letterCombinations("23"), ["ad", "bd", "cd", "ae", "be", "ce", "af", "bf", "cf"])
    }

    func test2() {
        XCTAssertEqual(Solution().letterCombinations("234").count, 27)
    }

    func test3() {
        XCTAssertEqual(Solution().letterCombinations(""), [])
    }

    func test4() {
        XCTAssertEqual(Solution().letterCombinations("2"), ["a", "b", "c"])
    }
}

TestRunner().runTests(testClass: MyTests.self)

//: [Next](@next)
