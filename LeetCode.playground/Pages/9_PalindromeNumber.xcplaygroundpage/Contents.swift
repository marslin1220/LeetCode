//: [Previous](@previous)

// Q: https://leetcode.com/problems/palindrome-number/

//Runtime: 104 ms, faster than 13.18% of Swift online submissions for Palindrome Number.
//Memory Usage: 20.9 MB, less than 71.60% of Swift online submissions for Palindrome Number.

import XCTest

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else { return false }
        guard x > 9 else { return true }

        var currentX = x
        var xArray = [Int]()

        while currentX != 0 {
            xArray.append(currentX % 10)
            currentX = currentX / 10
        }

        return xArray == xArray.reversed()
    }
}

class MyTests : XCTestCase {
    func test1() {
        XCTAssertEqual(Solution().isPalindrome(121), true)
    }

    func test2() {
        XCTAssertEqual(Solution().isPalindrome(-121), false)
    }

    func test3() {
        XCTAssertEqual(Solution().isPalindrome(10), false)
    }

    func test4() {
        XCTAssertEqual(Solution().isPalindrome(0), true)
    }

    func test5() {
        XCTAssertEqual(Solution().isPalindrome(9), true)
    }
}

TestRunner().runTests(testClass: MyTests.self)

//: [Next](@next)
