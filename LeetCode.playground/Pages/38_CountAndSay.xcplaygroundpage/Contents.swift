//: [Previous](@previous)

// Question: https://leetcode.com/problems/count-and-say/

import XCTest

class Solution {
    func countAndSay(_ n: Int) -> String {
        var loopCount = 1
        var result = "1"

        while loopCount != n {
            var count = 0
            var prevChar: Character = " "
            var say = ""

            for (index, char) in result.enumerated() {
                if index == 0 {
                    prevChar = char
                }

                if char == prevChar {
                    count += 1
                } else {
                    say.append("\(count)\(prevChar)")
                    count = 1
                    prevChar = char
                }

                if index == (result.count - 1) {
                    say.append("\(count)\(prevChar)")
                }
            }

            loopCount += 1
            result = say
        }

        return result
    }
}

class MyTests : XCTestCase {
    func test1() {
        XCTAssertEqual(Solution().countAndSay(1), "1")
    }

    func test2() {
        XCTAssertEqual(Solution().countAndSay(4), "1211")
    }

    func test3() {
        XCTAssertEqual(Solution().countAndSay(5), "111221")
    }
}

TestRunner().runTests(testClass: MyTests.self)

//: [Next](@next)
