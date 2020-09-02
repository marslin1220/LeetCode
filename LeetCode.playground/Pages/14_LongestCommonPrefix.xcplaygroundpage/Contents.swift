//: [Previous](@previous)

//14. Longest Common Prefix
//https://leetcode.com/problems/longest-common-prefix/

//Runtime: 24 ms, faster than 70.72% of Swift online submissions for Longest Common Prefix.
//Memory Usage: 21.2 MB, less than 32.21% of Swift online submissions for Longest Common Prefix.

import XCTest

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard let firstStr = strs.first else { return "" }
        guard strs.count > 1 else { return strs.first! }

        let firstStrArray = Array(firstStr)
        let charArrays = strs[1...].compactMap { Array($0) }

        var charIndex = 0
        while charIndex < firstStrArray.count {
            let charAtIndex = firstStrArray[charIndex]

            for chars in charArrays {
                if charIndex >= chars.count || charAtIndex != chars[charIndex] {
                    return String(firstStrArray[0..<charIndex])
                }
            }

            charIndex += 1
        }

        return String(firstStr)
    }
}

class MyTests : XCTestCase {
    func test1() {
        XCTAssertEqual(Solution().longestCommonPrefix(["flower", "flow", "flight"]), "fl")
    }

    func test2() {
        XCTAssertEqual(Solution().longestCommonPrefix(["dog", "racecar", "car"]), "")
    }

    func test3() {
        XCTAssertEqual(Solution().longestCommonPrefix(["dog", "dog", "dog"]), "dog")
    }

    func test4() {
        XCTAssertEqual(Solution().longestCommonPrefix(["", "dog", "dog"]), "")
    }

    func test5() {
        XCTAssertEqual(Solution().longestCommonPrefix(["dog", "", "dog"]), "")
    }

    func test6() {
        XCTAssertEqual(Solution().longestCommonPrefix([""]), "")
    }

    func test7() {
        XCTAssertEqual(Solution().longestCommonPrefix(["hello"]), "hello")
    }
}

TestRunner().runTests(testClass: MyTests.self)


//: [Next](@next)
