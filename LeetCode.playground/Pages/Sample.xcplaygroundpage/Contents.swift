//: [Previous](@previous)

//1. Two Sum
//https://leetcode.com/problems/two-sum/

//Runtime: 44 ms, faster than 45.52% of Swift online submissions for Two Sum.
//Memory Usage: 21.4 MB, less than 5.88% of Swift online submissions for Two Sum.

import XCTest

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var result = [Int]()
        let sortedNums = nums.sorted()
        var right = nums.count - 1
        var left = 0
        var hitNum: Int = 0

        while left < right {
            let leftDiff = target - sortedNums[left]
            if leftDiff == sortedNums[right] {
                hitNum = sortedNums[left]
                break
            }

            if leftDiff > sortedNums[right] {
                left += 1
            }

            let rightDiff = target - sortedNums[right]
            if rightDiff < sortedNums[left] {
                right -= 1
            }
        }

        for (index, num) in nums.enumerated() {
            if num == hitNum || num == target - hitNum {
                result.append(index)
            }
        }

        return result
    }
}

class MyTests : XCTestCase {
    func test1() {
        XCTAssertEqual(Solution().twoSum([2, 7, 11, 15], 9), [0, 1])
    }
}

TestRunner().runTests(testClass: MyTests.self)

//: [Next](@next)
