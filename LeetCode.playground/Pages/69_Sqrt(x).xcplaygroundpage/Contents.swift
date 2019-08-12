//: [Previous](@previous)

import XCTest

class Solution {
    func mySqrt(_ x: Int) -> Int {
        if x <= 1 {
            return x
        }

        var left = 1
        var right = x - 1

        while true {
            let mid = Int((left + right) / 2)

            if mid == left {
                return left
            }

            let powMid = mid * mid
            if powMid == x {
                return mid
            }

            if powMid > x {
                right = mid
            } else {
                left = mid
            }
        }
    }
}

class MyTests : XCTestCase {
    func test1() {
        XCTAssertEqual(Solution().mySqrt(4), 2)
    }

    func test2() {
        XCTAssertEqual(Solution().mySqrt(8), 2)
    }

    func test3() {
        XCTAssertEqual(Solution().mySqrt(2), 1)
    }
}

TestRunner().runTests(testClass: MyTests.self)


//: [Next](@next)
