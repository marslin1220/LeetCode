//You are given two linked lists representing two non-negative numbers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
//
//Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
//Output: 7 -> 0 -> 8

import Cocoa

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
        var firstNumber = 0
        var secondNumber = 0
        var multiplyer = 1
        var tempNode = l1
        
        while tempNode != nil {
            firstNumber += (tempNode?.val)! * multiplyer
            multiplyer *= 10
            tempNode = tempNode?.next
        }
        
        tempNode = l2
        multiplyer = 1
        while tempNode != nil {
            secondNumber += (tempNode?.val)! * multiplyer
            multiplyer *= 10
            tempNode = tempNode?.next
        }
        print(secondNumber)
        
        return numberToListNode(number: firstNumber + secondNumber)
    }
    
    func numberToListNode(number: Int) -> ListNode? {
        var transferNumber = number
        
        let sumNode = ListNode(transferNumber % 10)
        var tempNode = sumNode
        while transferNumber > 9 {
            transferNumber = Int(transferNumber / 10)
            let childNode = ListNode(transferNumber % 10)
            tempNode.next = childNode
            tempNode = childNode
        }
        
        return sumNode
    }
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

var solution = Solution()
var l1 = solution.numberToListNode(number: 243)
var l2 = solution.numberToListNode(number: 564)
solution.addTwoNumbers(l1, l2)