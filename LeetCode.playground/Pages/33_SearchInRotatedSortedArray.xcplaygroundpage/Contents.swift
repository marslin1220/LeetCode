//: [Previous](@previous)

// Question: https://leetcode.com/problems/search-in-rotated-sorted-array/

import XCTest

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.endIndex - 1

        if left == right {
            return nums[left] == target ? left : -1
        }

        while left < right {
            let mid = Int(ceil(Float(left + right) / 2))

            if nums[left] == target {
                return left
            }

            if nums[right] == target {
                return right
            }

            if mid == right {
                break
            }

            if nums[mid] == target {
                return mid
            }

            // 1. Pivot is not in the range
            if nums[left] < nums[right] {
                if target > nums[mid] {
                    left = mid
                } else {
                    right = mid
                }

                continue
            }

            // 2. Pivot is in the range
            if nums[left] < nums[mid] {
                // 2.1. Pivot is on the right of the middle

                if nums[left] < target && target < nums[mid] {
                    right = mid
                } else {
                    left = mid
                }
            } else {
                // 2.2. Pivot is on the left of the middle

                if nums[mid] < target && target < nums[right] {
                    left = mid
                } else {
                    right = mid
                }
            }
        }

        return -1
    }
}

class MyTests : XCTestCase {
    func test1() {
        XCTAssertEqual(Solution().search([4,5,6,7,0,1,2], 0), 4)
    }

    func test2() {
        XCTAssertEqual(Solution().search([4,5,6,7,0,1,2], 3), -1)
    }

    func test3() {
        XCTAssertEqual(Solution().search([1], 1), 0)
    }

    func test4() {
        XCTAssertEqual(Solution().search([1,3,5], 2), -1)
    }
}

TestRunner().runTests(testClass: MyTests.self)

//: [Next](@next)
