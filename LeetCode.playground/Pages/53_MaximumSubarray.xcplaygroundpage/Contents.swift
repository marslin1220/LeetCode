//: [Previous](@previous)

//53. Maximum Subarray
//https://leetcode.com/problems/maximum-subarray/

//Ref: https://hannahpun.gitbook.io/leetcode-note/math/53-maximum-subarray

//Runtime: 36 ms, faster than 35.65% of Swift online submissions for Maximum Subarray.
//Memory Usage: 14.7 MB, less than 11.07% of Swift online submissions for Maximum Subarray.

import XCTest

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var maxResult = Int.min
        nums.reduce(0) { (result, current) -> Int in
            let currentMax = max(result + current, current)
            maxResult = max(maxResult, currentMax)
            return currentMax
        }

        return maxResult
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
