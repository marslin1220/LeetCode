//: [Previous](@previous)

//1. Two Sum
//https://leetcode.com/problems/two-sum/

// ref: https://github.com/soapyigu/LeetCode-Swift/blob/master/Array/TwoSum.swift
//Runtime: 36 ms, faster than 68.68% of Swift online submissions for Two Sum.
//Memory Usage: 21.2 MB, less than 5.88% of Swift online submissions for Two Sum.

import XCTest

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()

        for (i, num) in nums.enumerated() {
            if let lastIndex = dict[target - num] {
                return [lastIndex, i]
            }

            dict[num] = i
        }

        fatalError("No valid outputs")
    }
}

class MyTests : XCTestCase {
    func test1() {
        XCTAssertEqual(Solution().twoSum([2, 7, 11, 15], 9), [0, 1])
    }
}

TestRunner().runTests(testClass: MyTests.self)

//: [Next](@next)
