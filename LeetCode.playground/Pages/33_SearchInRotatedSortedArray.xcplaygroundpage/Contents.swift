//: [Previous](@previous)

// Question: https://leetcode.com/problems/search-in-rotated-sorted-array/

import XCTest

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        return nums.firstIndex(of: target) ?? -1
    }
}

class MyTests : XCTestCase {
    func test1() {
        XCTAssertEqual(Solution().search([4,5,6,7,0,1,2], 0), 4)
    }

    func test2() {
        XCTAssertEqual(Solution().search([4,5,6,7,0,1,2], 3), -1)
    }
}

TestRunner().runTests(testClass: MyTests.self)

//: [Next](@next)
