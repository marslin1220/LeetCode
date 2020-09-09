//: [Previous](@previous)

//35. Search Insert Position
//https://leetcode.com/problems/search-insert-position/

//Runtime: 36 ms, faster than 64.85% of Swift online submissions for Search Insert Position.
//Memory Usage: 20.8 MB, less than 72.70% of Swift online submissions for Search Insert Position.

import XCTest

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        guard !nums.isEmpty else { return 0 }

        var lowIndex: Int = 0
        var highIndex: Int = nums.count - 1
        var insertIndex: Int = 0

        while lowIndex <= highIndex {
            let midIndex = (lowIndex + highIndex) / 2 + (lowIndex + highIndex) % 2
            if nums[midIndex] == target {
                return midIndex
            } else if nums[midIndex] > target {
                highIndex = midIndex - 1
                insertIndex = midIndex
            } else {
                lowIndex = midIndex + 1
                insertIndex = lowIndex
            }
        }

        return insertIndex
    }
}

class MyTests : XCTestCase {
    func test1() {
      XCTAssertEqual(Solution().searchInsert([1,3,5,6], 5), 2)
    }

    func test2() {
      XCTAssertEqual(Solution().searchInsert([1,3,5,6], 2), 1)
    }

    func test3() {
      XCTAssertEqual(Solution().searchInsert([1,3,5,6], 7), 4)
    }

    func test4() {
      XCTAssertEqual(Solution().searchInsert([1,3,5,6], 0), 0)
    }
}

TestRunner().runTests(testClass: MyTests.self)

//: [Next](@next)
