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
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 2 else {
            return [[Int]]()
        }

        var result = [[Int]]()
        let sortedNums = nums.sorted()
        let numCount = sortedNums.count
        var oldFirstNum = Int.max

        for (index, firstNum) in sortedNums.enumerated() {
            if firstNum > 0 {
                break
            }

            if index + 1 >= numCount - 1 {
                break
            }

            if firstNum == oldFirstNum {
                continue
            }

            oldFirstNum = firstNum

            let secondLayerNums = sortedNums[(index + 1) ..< numCount]

            var oldSecondNum = Int.max
            var endIndex = secondLayerNums.endIndex

            for (secondIndex, secondNum) in secondLayerNums.enumerated() {
                let secondStartIndex = secondLayerNums.startIndex + secondIndex

                if secondStartIndex + 1 >= endIndex {
                    break
                }

                if secondNum == oldSecondNum {
                    continue
                }
                oldSecondNum = secondNum

                let rest = secondLayerNums[(secondStartIndex + 1) ..< endIndex]
                let oppositeNum = -(firstNum + secondNum)
                if oppositeNum < secondNum {
                    break
                }

                if let matchedIndex = rest.firstIndex(of: oppositeNum) {
                    result.append([firstNum, secondNum, oppositeNum])
                    endIndex = matchedIndex
                    continue
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

