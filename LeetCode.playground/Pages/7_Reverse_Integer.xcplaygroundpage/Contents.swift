//: [Previous](@previous)

// 7. Reverse Integer
// https://leetcode.com/problems/reverse-integer/

import XCTest

class Solution {
    func reverse(_ x: Int) -> Int {
        var originalX = x
        var reverseIntegerArray: [Int] = []
        var trimZero = true

        while originalX != 0 {
            let remain = originalX % 10
            originalX = originalX / 10

            if remain != 0 {
                trimZero = false
                reverseIntegerArray.append(remain)
            } else if !trimZero {
                reverseIntegerArray.append(remain)
            }
        }

        let reversedInt = reverseIntegerArray.reduce(0) { $0 * 10 + $1 }

        if reversedInt > Int32.max || reversedInt < Int32.min {
            return 0
        }

        return reversedInt
    }
}

class MyTests : XCTestCase {
    func test1() {
        XCTAssertEqual(Solution().reverse(123), 321)
    }

    func test2() {
        XCTAssertEqual(Solution().reverse(-123), -321)
    }

    func test3() {
        XCTAssertEqual(Solution().reverse(120), 21)
    }

    func test4() {
        XCTAssertEqual(Solution().reverse(100100), 1001)
    }

    func test5() {
        XCTAssertEqual(Solution().reverse(1534236469), 0)
    }

    func test6() {
        XCTAssertEqual(Solution().reverse(-2147483648), 0)
    }
}

TestRunner().runTests(testClass: MyTests.self)

//: [Next](@next)
