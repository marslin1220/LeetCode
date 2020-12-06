//: [Previous](@previous)

import XCTest

//16. 3Sum Closest
//https://leetcode.com/problems/3sum-closest/

//Runtime: 48 ms, faster than 97.98% of Swift online submissions for 3Sum Closest.
//Memory Usage: 14.5 MB, less than 7.07% of Swift online submissions for 3Sum Closest.

class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let sortedNum = nums.sorted()
        var result: Int?

        for index in 0...(sortedNum.count - 3) {
            var left = index + 1
            var right = sortedNum.endIndex - 1

            if index != 0 && sortedNum[index - 1] == sortedNum[index] {
                continue
            }

            while left < right {
                let sum = sortedNum[index] + sortedNum[left] + sortedNum[right]
                if sum == target {
                    return sum
                }

                if let currentResult = result {
                    if abs(target - currentResult) > abs(target - sum) {
                        result = sum
                    }
                } else {
                    result = sum
                }

                if sum < target {
                    repeat {
                        left += 1
                    } while left < right && sortedNum[left] == sortedNum[left - 1]
                } else {
                    repeat {
                        right -= 1
                    } while left < right && sortedNum[right] == sortedNum[right + 1]
                }
            }
        }

        return result!
    }
}

class MyTests : XCTestCase {
    let solution = Solution()

    func test1() {
        XCTAssertEqual(solution.threeSumClosest([1,1,1,1], -100), 3)
    }
}

TestRunner().runTests(testClass: MyTests.self)

//: [Next](@next)
