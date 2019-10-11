//: [Previous](@previous)

//49. Group Anagrams
//Q: https://leetcode.com/problems/group-anagrams/


import XCTest

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {

        // Key: "eat" -> "aet" after sorted
        // Value: index array of the same sorted string
        var groupedAnagrams: [String: [String]] = [:]

        for element in strs {
            let sortedElement = String(element.sorted())

            guard var matchedArray = groupedAnagrams[sortedElement] else {
                groupedAnagrams[sortedElement] = [element]
                continue
            }

            matchedArray.append(element)
            groupedAnagrams[sortedElement] = matchedArray
        }

        return Array(groupedAnagrams.values)
    }
}

class MyTests : XCTestCase {
    func test1() {
        XCTAssertEqual(Solution().groupAnagrams(["eat","tea","tan","ate","nat","bat"]), [["tan", "nat"], ["bat"], ["eat", "tea", "ate"]])
    }
}

TestRunner().runTests(testClass: MyTests.self)

//: [Next](@next)
