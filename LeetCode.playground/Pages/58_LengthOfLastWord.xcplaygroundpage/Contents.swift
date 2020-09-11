//: [Previous](@previous)

//58. Length of Last Word
//https://leetcode.com/problems/length-of-last-word/

//Runtime: 4 ms, faster than 97.16% of Swift online submissions for Length of Last Word.
//Memory Usage: 21.3 MB, less than 30.50% of Swift online submissions for Length of Last Word.

import XCTest

class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        return s.split(separator: " ").last?.count ?? 0
    }
}

class MyTests : XCTestCase {
    let solution = Solution()

    func test1() {
        XCTAssertEqual(solution.lengthOfLastWord("Hello World"), 5)
    }
}

TestRunner().runTests(testClass: MyTests.self)

//: [Next](@next)
