//: [Previous](@previous)

import XCTest

class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        if intervals.count <= 1 {
            return intervals
        }

        var result = [[Int]]()
        result.append(intervals.first!)

        for interval in intervals[1..<intervals.count] {
            var tempResult = [[Int]]()
            var tempInterval = interval

            for mergedInterval in result {
                if interval.first! <= mergedInterval.last! && interval.last! >= mergedInterval.first! {
                    let sorted = [interval.first!, interval.last!, mergedInterval.first!, mergedInterval.last!, tempInterval.first!, tempInterval.last!].sorted()
                    tempInterval = [sorted.first!, sorted.last!]
                } else {
                    tempResult.append(mergedInterval)
                }
            }

            tempResult.append(tempInterval)

            result = tempResult
        }

        return result
    }
}

class MyTests : XCTestCase {
    func test1() {
        XCTAssertEqual(Solution().merge([[1,3],[2,6],[8,10],[15,18]]), [[1,6],[8,10],[15,18]])
    }

    func test2() {
        XCTAssertEqual(Solution().merge([[1,4],[2,3]]), [[1,4]])
    }

    func test3() {
        XCTAssertEqual(Solution().merge([[2,3],[4,6],[5,7],[3,4]]), [[2,7]])
    }
}

TestRunner().runTests(testClass: MyTests.self)

//: [Next](@next)
