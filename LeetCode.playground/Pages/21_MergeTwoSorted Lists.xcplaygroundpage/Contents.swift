//: [Previous](@previous)

// 21. Merge Two Sorted Lists
// https://leetcode.com/problems/merge-two-sorted-lists/submissions/

//Runtime: 16 ms, faster than 80.28% of Swift online submissions for Merge Two Sorted Lists.
//Memory Usage: 20.8 MB, less than 54.44% of Swift online submissions for Merge Two Sorted Lists.

import XCTest

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

/**
* Definition for singly-linked list.
* public class ListNode {
*     public var val: Int
*     public var next: ListNode?
*     public init() { self.val = 0; self.next = nil; }
*     public init(_ val: Int) { self.val = val; self.next = nil; }
*     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
* }
*/
class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard l1 != nil else { return l2 }
        guard l2 != nil else { return l1 }

        var list1 = l1
        var list2 = l2
        let result = (list1!.val <= list2!.val) ? list1 : list2
        var resultIndex: ListNode? = nil

        while list1 != nil || list2 != nil {
            if list1 == nil {
                resultIndex?.next = list2
                return result
            } else if list2 == nil {
                resultIndex?.next = list1
                return result
            } else if list1!.val <= list2!.val {
                resultIndex?.next = list1
                resultIndex = list1
                list1 = list1?.next
            } else {
                resultIndex?.next = list2
                resultIndex = list2
                list2 = list2?.next
            }
        }

        return result
    }
}

class MyTests : XCTestCase {
    func test1() {
        let l1 = ListNode(1)
        l1.next = ListNode(2)
        l1.next?.next = ListNode(4)

        let l2 = ListNode(1)
        l2.next = ListNode(3)
        l2.next?.next = ListNode(4)

        let result = Solution().mergeTwoLists(l1, l2)

        XCTAssertEqual(result?.val, 1)
        XCTAssertEqual(result?.next?.val, 1)
        XCTAssertEqual(result?.next?.next?.val, 2)
        XCTAssertEqual(result?.next?.next?.next?.val, 3)
        XCTAssertEqual(result?.next?.next?.next?.next?.val, 4)
        XCTAssertEqual(result?.next?.next?.next?.next?.next?.val, 4)
    }
}

TestRunner().runTests(testClass: MyTests.self)

//: [Next](@next)
