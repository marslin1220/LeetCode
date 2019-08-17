//: [Previous](@previous)

import XCTest

class Solution {
    func subsets(nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        result.append([])

        for num in nums {
            let subsets = result
            for var subset in subsets {
                subset.append(num)
                result.append(subset)
            }
        }

        return result
    }
}

class MyTests: XCTestCase {
    func test1() {
        XCTAssertEqual(Solution().subsets(nums: [1, 2, 3]), [[1], [1, 2], [2], [1, 3], [1, 2, 3], [2, 3], [3], []])
    }
}

TestRunner().runTests(testClass: MyTests.self)

//: [Next](@next)
