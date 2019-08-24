//: [Previous](@previous)

// 121. Best Time to Buy and Sell Stock
// Q: https://leetcode.com/problems/best-time-to-buy-and-sell-stock/

import XCTest

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var profit = 0
        var lowestPrice = Int.max

        for price in prices {
            if price < lowestPrice {
                lowestPrice = price
            }

            if price - lowestPrice > profit {
                profit = price - lowestPrice
            }
        }

        return profit
    }
}

class MyTests : XCTestCase {
    func test1() {
      XCTAssertEqual(Solution().maxProfit([7,1,5,3,6,4]), 5)
    }

    func test2() {
      XCTAssertEqual(Solution().maxProfit([7,6,4,3,1]), 0)
    }

    func test3() {
        XCTAssertEqual(Solution().maxProfit([]), 0)
    }

    func test4() {
        XCTAssertEqual(Solution().maxProfit([2,4,1]), 2)
    }
}

TestRunner().runTests(testClass: MyTests.self)

//: [Next](@next)
