//: [Previous](@previous)

//53. Maximum Subarray
//https://leetcode.com/problems/maximum-subarray/

//ref: https://windsuzu.github.io/leetcode-53/

//Runtime: 36 ms, faster than 93.44% of Swift online submissions for Maximum Subarray.
//Memory Usage: 20.9 MB, less than 75.05% of Swift online submissions for Maximum Subarray.

import XCTest

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }
        var temp = nums[0], end = nums[0]
        for i in 1..<nums.count {
            temp = max(temp + nums[i], nums[i])
            end = max(temp, end)
        }
        return end
    }
}

class MyTests : XCTestCase {
    let solution = Solution()

    func test1() {
        XCTAssertEqual(solution.maxSubArray([-2,1,-3,4,-1,2,1,-5,4]), 6)
    }

    func test2() {
        XCTAssertEqual(solution.maxSubArray([1]), 1)
    }

    func test3() {
        XCTAssertEqual(solution.maxSubArray([-1]), -1)
    }

    func test4() {
        XCTAssertEqual(solution.maxSubArray([-2147483647]), -2147483647)
    }

    func test5() {
        XCTAssertEqual(solution.maxSubArray([7,-4,-5,9,7,4,9,-4,6,-7,9,-5,7,0,-7,-5,-3,-7]), 35)
    }
}

TestRunner().runTests(testClass: MyTests.self)

//: [Next](@next)
