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
        var longestPalindromeString = String(s[s.startIndex])
        
        for priorIndex in s.indices {
            for postIndex in s[s.index(after: priorIndex)..<s.endIndex].indices {
                let substring = String(s[priorIndex...postIndex])
                if (isPalindromic(substring) && substring.count > longestPalindromeString.count) {
                    longestPalindromeString = substring
                    continue
                }
            }
        }
        
        return longestPalindromeString
    }
    
    func isPalindromic(_ s: String) -> Bool {
        return s == String(s.reversed())
    }
}

class MyTests : XCTestCase {
    
    func testFirstCase() {
        XCTAssertEqual(Solution().longestPalindrome("babad"), "bab")
    }
    
    func testSecondCase() {
        XCTAssertEqual(Solution().longestPalindrome("cbbd"), "bb")
    }
    
//    func testLongCase() {
//        XCTAssertEqual(Solution().longestPalindrome("civilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadswfilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth"), "ranynar")
//    }

}

TestRunner().runTests(testClass: MyTests.self)


//: [Next](@next)
