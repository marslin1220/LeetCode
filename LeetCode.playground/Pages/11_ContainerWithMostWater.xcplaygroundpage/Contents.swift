//: [Previous](@previous)

// 11. Container With Most Water
// https://leetcode.com/problems/container-with-most-water/

//Runtime: 144 ms, faster than 59.55% of Swift online submissions for Container With Most Water.
//Memory Usage: 14.6 MB, less than 76.05% of Swift online submissions for Container With Most Water.

import XCTest

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        guard height.count > 1 else { return 0 }

        var result: Int = 0
        var l = 0
        var r = height.count - 1
        while l < r {
            result = max(result, min(height[l], height[r]) * (r - l))

            if height[l] > height[r] {
                r -= 1
            } else {
                l += 1
            }
        }

        return result
    }
}

class MyTests : XCTestCase {
    let solution = Solution()

    func test1() {
        XCTAssertEqual(solution.maxArea([1,8,6,2,5,4,8,3,7]), 49)
    }

    func test2() {
        XCTAssertEqual(solution.maxArea([1,1]), 1)
    }

    func test3() {
        XCTAssertEqual(solution.maxArea([4,3,2,1,4]), 16)
    }

    func test4() {
        XCTAssertEqual(solution.maxArea([1,2,1]), 2)
    }
}

TestRunner().runTests(testClass: MyTests.self)

//: [Next](@next)
