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
        
        var start = 0
        var end = 0
        
        let sChars = [Character](s)
        
        for i in 0..<s.count {
            let len1 = expandAroundCenter(sChars, left: i, right: i)
            let len2 = expandAroundCenter(sChars, left: i, right: (i + 1))
            let len = max(len1, len2)

            if len > end - start {
                start = i - (len - 1) / 2;
                end = i + len / 2;
            }
        }
        
        return String(sChars[start...end])
    }

    func expandAroundCenter(_ chars: [Character], left: Int, right: Int) -> Int {

        var L = left
        var R = right

        while (L >= 0 && R < chars.count && chars[L] == chars[R]) {
            L -= 1
            R += 1
        }

        return R - L - 1
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
