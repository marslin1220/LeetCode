//: [Previous](@previous)

// Q: https://leetcode.com/problems/palindrome-number/

//Runtime: 36 ms, faster than 96.55% of Swift online submissions for Palindrome Number.
//Memory Usage: 21.1 MB, less than 32.46% of Swift online submissions for Palindrome Number.

import XCTest

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        // Special cases:
        // As discussed above, when x < 0, x is not a palindrome.
        // Also if the last digit of the number is 0, in order to be a palindrome,
        // the first digit of the number also needs to be 0.
        // Only 0 satisfy this property.
        guard x >= 0 && (x % 10 != 0 || x == 0) else { return false }

        var currentX = x
        var revertedX = 0

        while currentX > revertedX {
            revertedX = revertedX * 10 + currentX % 10
            currentX /= 10
        }

        // When the length is an odd number, we can get rid of the middle digit by revertedNumber/10
        // For example when the input is 12321, at the end of the while loop we get x = 12, revertedNumber = 123,
        // since the middle digit doesn't matter in palidrome(it will always equal to itself), we can simply get rid of it.
        return currentX == revertedX || currentX == revertedX / 10
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
