//: [Previous](@previous)

//2. Add Two Numbers
//https://leetcode.com/problems/add-two-numbers/

//Runtime: 44 ms, faster than 92.88% of Swift online submissions for Add Two Numbers.
//Memory Usage: 20.7 MB, less than 11.11% of Swift online submissions for Add Two Numbers.

import XCTest

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let _ = l1 else { fatalError("No valid outputs") }
        guard let _ = l2 else { fatalError("No valid outputs") }

        var node1 = l1
        var node2 = l2
        var carry = 0
        var result: ListNode? = nil
        var current: ListNode? = nil
        
        while true {
            let sum = (node1?.val ?? 0) + (node2?.val ?? 0) + carry
            let nextNode = ListNode(sum % 10)
            carry = sum > 9 ? 1 : 0

            if result == nil {
                result = nextNode
            }

            if current != nil {
                current?.next = nextNode
            }

            current = nextNode

            node1 = node1?.next
            node2 = node2?.next

            if node1 == nil && node2 == nil && carry == 0 {
                break
            }
        }
        
        return result
    }
}

// Mark - ListNode Defination

class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

extension ListNode {
    // for testing only
    convenience init(number: Int) {
        self.init(number % 10)

        var transferNumber = Int(number / 10)
        var current: ListNode = self
        while transferNumber != 0 {
            current.next = ListNode(transferNumber % 10)
            current = current.next!

            transferNumber = Int(transferNumber / 10)
        }
    }
}

extension ListNode: Equatable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val == rhs.val && lhs.next == rhs.next
    }
}

extension ListNode: CustomStringConvertible {
    var description: String {
        var des = ""
        var current: ListNode? = self
        while current != nil {
            des = "\(des)\(current!.val)"
            if current?.next != nil {
                des = "\(des) -> "
            } else {
                break
            }

            current = current?.next
        }

        return des
    }
}

class MyTests : XCTestCase {
    func test1() {
        let l1 = ListNode(number: 342)
        let l2 = ListNode(number: 465)
        let expected = ListNode(number: 807)
        let answer = Solution().addTwoNumbers(l1, l2)
        XCTAssertEqual(answer, expected)
    }
}

TestRunner().runTests(testClass: MyTests.self)

//: [Next](@next)
