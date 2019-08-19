//: [Previous](@previous)

// 88. Merge Sorted Array
// Q: https://leetcode.com/problems/merge-sorted-array/

import XCTest

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        if m == 0 {
            for (index, num2) in nums2.enumerated() {
                nums1[index] = num2
            }

            return
        }

        if n == 0 {
            return
        }

        var num1Index = m - 1
        var num2Index = n - 1

        while num1Index >= 0 || num2Index >= 0 {
            if num1Index < 0 {
                nums1[num2Index] = nums2[num2Index]
                num2Index -= 1

                continue
            } else if num2Index < 0 {
                nums1[num1Index] = nums1[num1Index]
                num1Index -= 1

                continue
            }

            if nums1[num1Index] > nums2[num2Index] {
                nums1[num1Index + num2Index + 1] = nums1[num1Index]
                num1Index -= 1
            } else {
                nums1[num1Index + num2Index + 1] = nums2[num2Index]
                num2Index -= 1
            }
        }
    }
}

class MyTests: XCTestCase {
    func test1() {
        var nums1 = [1, 2, 3, 0, 0, 0]
        Solution().merge(&nums1, 3, [2, 5, 6], 3)

        XCTAssertEqual(nums1, [1, 2, 2, 3, 5, 6])
    }

    func test2() {
        var nums1 = [1]
        Solution().merge(&nums1, 1, [], 0)

        XCTAssertEqual(nums1, [1])
    }

    func test3() {
        var nums1 = [0]
        Solution().merge(&nums1, 0, [1], 1)

        XCTAssertEqual(nums1, [1])
    }

    func test4() {
        var nums1 = [1, 0]
        Solution().merge(&nums1, 1, [2], 1)

        XCTAssertEqual(nums1, [1, 2])
    }

}

TestRunner().runTests(testClass: MyTests.self)
//: [Next](@next)
