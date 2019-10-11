//: [Previous](@previous)

//Given an array S of n integers, are there elements a, b, c in S such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
//
//Note: The solution set must not contain duplicate triplets.
//
//For example, given array S = [-1, 0, 1, 2, -1, -4],
// [-4, -1, -1, 0, 1, 2]
//
//A solution set is:
//[
//  [-1, 0, 1],
//  [-1, -1, 2]
//]

import XCTest

class Solution {
    //Ref: https://github.com/soapyigu/LeetCode-Swift/blob/master/Array/ThreeSum.swift
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()

        guard nums.count > 2 else {
            return result
        }

        let sortedNums = nums.sorted()

        for index in 0...(sortedNums.count - 3) {
            let remain = -sortedNums[index]
            var left = index + 1
            var right = sortedNums.endIndex - 1

            if index != 0 && sortedNums[index - 1] == sortedNums[index] {
                continue
            }

            while left < right {
                let sum = sortedNums[left] + sortedNums[right]

                if sum == remain {
                    result.append([sortedNums[index], sortedNums[left], sortedNums[right]])
                }

                if sum > remain {
                    repeat {
                        right -= 1
                    } while left < right && sortedNums[right + 1] == sortedNums[right]
                } else {
                    repeat {
                        left += 1
                    } while left < right && sortedNums[left - 1] == sortedNums[left]
                }
            }
        }

        return result
    }
}

class MyTests : XCTestCase {
    func testLessThanTwoInt() {
        let answer = Solution().threeSum([-1, 0, 1, 2, -1, -4])
        XCTAssertTrue(answer.elementsEqual([[-1, -1, 2], [-1, 0, 1]]))
    }

    func test3Zeros() {
        let answer = Solution().threeSum([0, 0, 0])
        XCTAssertTrue(answer.elementsEqual([[0, 0, 0]]))
    }

    func test4Zeros() {
        let answer = Solution().threeSum([0, 0, 0, 0])
        XCTAssertTrue(answer.elementsEqual([[0, 0, 0]]))
    }
}

TestRunner().runTests(testClass: MyTests.self)

//: [Next](@next)

