//: [Previous](@previous)

// Q: https://leetcode.com/problems/longest-substring-without-repeating-characters/

//* Runtime: 76 ms, faster than 37.15% of Swift online submissions for Longest Substring Without Repeating Characters.
//* Memory Usage: 21.3 MB, less than 12.50% of Swift online submissions for Longest Substring Without Repeating Characters.

import XCTest

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var longestSubStringCount = 0
        var substringCharIndex = [Character: Int]()
        var left = 0
        let stringArray = Array(s)

        for index in Array(0 ..< s.count) {
            let char = stringArray[index]
            if substringCharIndex[char] == nil {
                longestSubStringCount = max(longestSubStringCount, index - left + 1)
            } else {
                for leftIndex in left ..< substringCharIndex[char]! {
                    substringCharIndex[stringArray[leftIndex]] = nil
                }

                left = substringCharIndex[char]! + 1
            }

            substringCharIndex[char] = index
        }
        
        return longestSubStringCount
    }
}

class MyTests : XCTestCase {
    
    func testFirstCase() {
        XCTAssertEqual(Solution().lengthOfLongestSubstring("abcabcbb"), 3)
    }

    func testSecondCase() {
        XCTAssertEqual(Solution().lengthOfLongestSubstring("bbbbb"), 1)
    }

    func testThirdCase() {
        XCTAssertEqual(Solution().lengthOfLongestSubstring("pwwkew"), 3)
    }

    func testFirstFailedCase() {
        XCTAssertEqual(Solution().lengthOfLongestSubstring("abba"), 2)
    }

    func test5() {
        XCTAssertEqual(Solution().lengthOfLongestSubstring("tmmzuxt"), 5)
    }
}

TestRunner().runTests(testClass: MyTests.self)

//: [Next](@next)
