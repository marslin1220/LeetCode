//: [Previous](@previous)

//67. Add Binary
//Q: https://leetcode.com/problems/add-binary/

import XCTest

class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        var output = ""
        let aChars = Array(a)
        let bChars = Array(b)

        var outputIndex = 0
        var carry = 0
        while outputIndex < aChars.count || outputIndex < bChars.count {
            var aBinary: Int {
                if outputIndex >= aChars.count {
                    return 0
                } else {
                    return aChars[aChars.count - outputIndex - 1].wholeNumberValue!
                }
            }

            var bBinary: Int {
                if outputIndex >= bChars.count {
                    return 0
                } else {
                    return bChars[bChars.count - outputIndex - 1].wholeNumberValue!
                }
            }

            let result = aBinary + bBinary + carry
            let sum = (result >= 2) ? result - 2 : result
            carry = (result >= 2) ? 1 : 0

            output.append("\(sum)".first!)
            outputIndex += 1
        }

        if carry == 1 {
            output.append("1")
        }

        return String(output.reversed())
    }
}

class MyTests : XCTestCase {
    func test1() {
        XCTAssertEqual(Solution().addBinary("11", "1"), "100")
    }

    func test2() {
        XCTAssertEqual(Solution().addBinary("1010", "1011"), "10101")
    }
}

TestRunner().runTests(testClass: MyTests.self)

//: [Next](@next)
