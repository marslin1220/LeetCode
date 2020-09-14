//: [Previous](@previous)

//66. Plus One
//https://leetcode.com/problems/plus-one/

//Runtime: 20 ms, faster than 7.62% of Swift online submissions for Plus One.
//Memory Usage: 21 MB, less than 49.21% of Swift online submissions for Plus One.

import XCTest

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var revertedDigits = [Int](digits.reversed())

        for index in 0...revertedDigits.count {
            if index == revertedDigits.count {
                revertedDigits.append(1)
                break
            }
            let digit = revertedDigits[index] + 1
            revertedDigits[index] = digit % 10

            if digit / 10 != 1 { break }
        }

        return [Int](revertedDigits.reversed())
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
