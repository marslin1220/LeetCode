//: [Previous](@previous)

// Q: https://leetcode.com/problems/zigzag-conversion/

//Runtime: 108 ms, faster than 33.04% of Swift online submissions for ZigZag Conversion.
//Memory Usage: 21.6 MB, less than 20.00% of Swift online submissions for ZigZag Conversion.

import XCTest

class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows == 1 { return s }

        var charDictionary = [Int: [Character]]()
        var rowIndex = 0
        var increasement = 1

        for char in Array(s) {
            if var charInRow = charDictionary[rowIndex] {
                charInRow.append(char)
                charDictionary[rowIndex] = charInRow
            } else {
                charDictionary[rowIndex] = [char]
            }

            if rowIndex == numRows - 1 {
                increasement = -1
            } else if rowIndex == 0{
                increasement = 1
            }

            rowIndex += increasement
        }

        var result = [Character]()
        for row in 0 ..< numRows {
            result.append(contentsOf: charDictionary[row] ?? [])
        }

        return String(result)
    }
}

class MyTests : XCTestCase {
    func test1() {
        XCTAssertEqual(Solution().convert("PAYPALISHIRING", 3), "PAHNAPLSIIGYIR")
    }

    func test2() {
        XCTAssertEqual(Solution().convert("PAYPALISHIRING", 4), "PINALSIGYAHRPI")
    }

    func test3() {
        XCTAssertEqual(Solution().convert("", 1), "")
    }

    func test4() {
        XCTAssertEqual(Solution().convert("AB", 1), "AB")
    }
}

TestRunner().runTests(testClass: MyTests.self)

//: [Next](@next)
