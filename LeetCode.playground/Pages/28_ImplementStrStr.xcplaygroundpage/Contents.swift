//: [Previous](@previous)

//Question: https://leetcode.com/problems/implement-strstr/

import XCTest

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle.count == 0 {
            return 0
        }

        var currentHaystack = haystack
        let needleFirstChar = needle.first!
        let needleCount = needle.count
        var jumpIndex = 0

        while currentHaystack.count >= needleCount {
            let endIndex = currentHaystack.endIndex
            guard let firstIndex = currentHaystack.firstIndex(of: needleFirstChar) else {
                break
            }

            if needleCount > currentHaystack.distance(from: firstIndex, to: endIndex) {
                break
            }

            let needleEndIndex = currentHaystack.index(firstIndex, offsetBy: needleCount)
            let haystackSubstring = currentHaystack[firstIndex ..< needleEndIndex]

            if needle == haystackSubstring {
                return jumpIndex + currentHaystack.distance(from: currentHaystack.startIndex, to: firstIndex)
            } else {
                let skipFirstIndex = currentHaystack.index(firstIndex, offsetBy: 1)
                jumpIndex += currentHaystack.distance(from: currentHaystack.startIndex, to: skipFirstIndex)
                currentHaystack = String(currentHaystack[skipFirstIndex ..< endIndex])
            }
        }

        return -1
    }
}

class MyTests : XCTestCase {
    func test1() {
        XCTAssertEqual(Solution().strStr("hello", "ll"), 2)
    }

    func test2() {
        XCTAssertEqual(Solution().strStr("aaaaa", "bba"), -1)
    }

    func test3() {
        XCTAssertEqual(Solution().strStr("aaa", "a"), 0)
    }

    func test4() {
        XCTAssertEqual(Solution().strStr("mississippi", "issip"), 4)
    }

    func test5() {
        XCTAssertEqual(Solution().strStr("mississippi", "pi"), 9)
    }
}

TestRunner().runTests(testClass: MyTests.self)


//: [Next](@next)
