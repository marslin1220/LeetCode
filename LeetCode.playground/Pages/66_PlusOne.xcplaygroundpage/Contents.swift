//: [Previous](@previous)

//66. Plus One
//https://leetcode.com/problems/plus-one/

//Runtime: 8 ms, faster than 83.59% of Swift online submissions for Plus One.
//Memory Usage: 20.9 MB, less than 60.37% of Swift online submissions for Plus One.

import XCTest

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var copiedDigits = digits

        for index in 0...(copiedDigits.count - 1) {
            let backwardIndex = copiedDigits.count - index - 1
            if copiedDigits[backwardIndex] == 9 {
                copiedDigits[backwardIndex] = 0
                if backwardIndex == 0 {
                    copiedDigits.insert(1, at: 0)
                }
            } else {
                copiedDigits[backwardIndex] += 1
                break
            }
        }

        return copiedDigits
    }
}

class MyTests : XCTestCase {
    let solution = Solution()

    func test1() {
        XCTAssertEqual(solution.plusOne([1, 2, 3]), [1, 2, 4])
    }

    func test2() {
        XCTAssertEqual(solution.plusOne([4, 3, 2, 1]), [4, 3, 2, 2])
    }

    func test3() {
        XCTAssertEqual(solution.plusOne([0]), [1])
    }
}

TestRunner().runTests(testClass: MyTests.self)

//: [Next](@next)
