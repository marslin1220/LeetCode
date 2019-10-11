//: [Previous](@previous)

// Q: https://leetcode.com/problems/remove-duplicates-from-sorted-array/

// Submission:
//Runtime: 68 ms, faster than 97.74% of Swift online submissions for Remove Duplicates from Sorted Array.
//Memory Usage: 21 MB, less than 25.00% of Swift online submissions for Remove Duplicates from Sorted Array.

import XCTest

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.isEmpty { return 0 }

        var currentIndex = 0

        for index in 1 ..< nums.count {
            if nums[index] == nums[currentIndex] {
                continue
            } else {
                currentIndex += 1
                nums[currentIndex] = nums[index]
            }
        }

        return currentIndex + 1
    }
}

class MyTests: XCTestCase {
    func test1() {
        var test = [1, 1, 2]
        XCTAssertEqual(Solution().removeDuplicates(&test), 2)
        XCTAssertEqual(test[0 ..< 2], [1, 2])
    }

    func test2() {
        var test = [0, 0, 1, 1, 1, 2, 2, 3, 3, 4]
        XCTAssertEqual(Solution().removeDuplicates(&test), 5)
        XCTAssertEqual(test[0 ..< 5], [0, 1, 2, 3, 4])
    }
}

TestRunner().runTests(testClass: MyTests.self)

//: [Next](@next)
