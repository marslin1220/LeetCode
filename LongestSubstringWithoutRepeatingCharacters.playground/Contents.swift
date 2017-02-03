//3. Longest Substring Without Repeating Characters   Add to List QuestionEditorial Solution  My Submissions
//Total Accepted: 228194
//Total Submissions: 966456
//Difficulty: Medium
//Contributors: Admin
//Given a string, find the length of the longest substring without repeating characters.
//
//Examples:
//
//Given "abcabcbb", the answer is "abc", which the length is 3.
//
//Given "bbbbb", the answer is "b", with the length of 1.
//
//Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.

import XCTest

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var nonRepeatingCharacters = [Character: Int]()
        var lengthOfLongestSubstring = 0
        var beginIndex = 0
        var charIndex = 0
        
        for character in s.characters {
            
            if !nonRepeatingCharacters.keys.contains(character) {
                nonRepeatingCharacters[character] = charIndex
            } else {
                if beginIndex < nonRepeatingCharacters[character]! + 1 {
                    beginIndex = nonRepeatingCharacters[character]! + 1
                }
                nonRepeatingCharacters[character] = charIndex
            }
            
            if lengthOfLongestSubstring < charIndex - beginIndex + 1 {
                lengthOfLongestSubstring = charIndex - beginIndex + 1
            }
            
            charIndex += 1
        }
        
        return lengthOfLongestSubstring
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
}

TestRunner().runTests(testClass: MyTests.self)
