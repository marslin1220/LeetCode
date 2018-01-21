//: [Previous](@previous)

//Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.
//
//Example:
//
//Input: "babad"
//
//Output: "bab"
//
//Note: "aba" is also a valid answer.
//Example:
//
//Input: "cbbd"
//
//Output: "bb"

import XCTest

class Solution {
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 1 else {
            return s
        }
        
        var sChars = [Character](s)
        let len = sChars.count
        var maxLen = 1
        var maxStart = 0
        var isPalin = Array(repeating: Array(repeating: false, count : len), count : len)
        
        // set palindrome whose len is 1
        for i in 0...len - 1 {
            isPalin[i][i] = true
        }
        
        // set palindrome whose len is 2
        for i in 0...len - 2 {
            if sChars[i] == sChars[i + 1] {
                isPalin[i][i + 1] = true
                maxLen = 2
                maxStart = i
            }
        }
        
        if len >= 3 {
            for length in 3...len {
                for i in 0...len - length {
                    if sChars[i] == sChars[i + length - 1] && isPalin[i + 1][i + length - 2] {
                        isPalin[i][i + length - 1] = true
                        maxLen = length
                        maxStart = i
                    }
                }
            }
        }
        
        return String(sChars[maxStart...maxStart + maxLen - 1])
    }
}

class MyTests : XCTestCase {
    
    func testFirstCase() {
        XCTAssertEqual(Solution().longestPalindrome("babad"), "bab")
    }
    
    func testSecondCase() {
        XCTAssertEqual(Solution().longestPalindrome("cbbd"), "bb")
    }
    
    func testLongCase() {
        XCTAssertEqual(Solution().longestPalindrome("civilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadswfilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth"), "ranynar")
    }

}

TestRunner().runTests(testClass: MyTests.self)


//: [Next](@next)
