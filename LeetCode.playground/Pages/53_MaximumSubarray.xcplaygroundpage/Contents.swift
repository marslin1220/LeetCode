//: [Previous](@previous)

//53. Maximum Subarray
//https://leetcode.com/problems/maximum-subarray/

import XCTest

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums.first ?? 0 }
        guard let first = nums.first, let last = nums.last else { return 0 }

        let noFirstMax = maxSubArray([Int](nums[1...]))
        let noLastMax = maxSubArray([Int](nums[..<(nums.count - 1)]))
        let sum = nums.reduce(0, +)

        print("++++++++++")
        let result = max(sum, max(first, noFirstMax), max(last, noLastMax))

        print("nums: \(nums)")
        print("result: \(result)")
        print("=========")
        return result
    }
}

class MyTests : XCTestCase {
    let solution = Solution()

//    func test1() {
//        XCTAssertEqual(solution.maxSubArray([-2,1,-3,4,-1,2,1,-5,4]), 6)
//    }
//
//    func test2() {
//        XCTAssertEqual(solution.maxSubArray([1]), 1)
//    }
//
//    func test3() {
//        XCTAssertEqual(solution.maxSubArray([-1]), -1)
//    }
//
//    func test4() {
//        XCTAssertEqual(solution.maxSubArray([-2147483647]), -2147483647)
//    }

    func test5() {
        XCTAssertEqual(solution.maxSubArray([7,-4,-5,9,7,4,9,-4,6,-7,9,-5,7,0,-7,-5,-3,-7]), 0)
    }
}

TestRunner().runTests(testClass: MyTests.self)

//: [Next](@next)
