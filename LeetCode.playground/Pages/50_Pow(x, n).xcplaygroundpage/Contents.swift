//: [Previous](@previous)

// 50. Pow(x, n)
// Q: https://leetcode.com/problems/powx-n/

import XCTest

class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {

        if n == 0 {
            return 1
        }

        // 將 n 轉換成二進位，用來取得後面次方的 key

        var remain = n > 0 ? n : -n
        var powerX = x
        var result: Double = 1

        // 取得結果
        while true {
            if remain % 2 == 0 {
                remain = Int(remain / 2)
                powerX = powerX * powerX
                continue
            }

            result *= powerX
            remain = Int(remain / 2)
            powerX = powerX * powerX

            if remain == 0 {
                break
            }
        }

        if n < 0 {
            result = 1 / result
        }

        return result
    }
}

class MyTests : XCTestCase {
    func test1() {
        XCTAssertEqual(Solution().myPow(2.0, 10), 1024.0)
    }

    func test2() {
        XCTAssertEqual(Solution().myPow(2.1, 3), 9.261)
    }

    func test3() {
        XCTAssertEqual(Solution().myPow(2.0, -2), 0.25)
    }
}

TestRunner().runTests(testClass: MyTests.self)


//: [Next](@next)
