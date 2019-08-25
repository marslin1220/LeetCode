//: [Previous](@previous)

//2. Add Two Numbers
//https://leetcode.com/problems/add-two-numbers/

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        var node1 = l1
        var node2 = l2
        let sumNode = ListNode(0)
        var tempNode = sumNode
        var quotient = 0
        
        while node1 != nil || node2 != nil {
            if node1 != nil {
                tempNode.val = (node1?.val)!
            }
            
            if node2 != nil {
                tempNode.val = tempNode.val + (node2?.val)!
            }
            
            tempNode.val += quotient
            
            if (tempNode.val > 9) {
                quotient = 1
                tempNode.val = tempNode.val % 10
            } else {
                quotient = 0
            }
            
            if node1?.next != nil || node2?.next != nil {
                tempNode.next = ListNode(0)
                tempNode = tempNode.next!
            } else if quotient != 0 {
                tempNode.next = ListNode(1)
                tempNode = tempNode.next!
            }
            
            node1 = node1?.next
            node2 = node2?.next
        }
        
        return sumNode
    }
    
    // for testing only
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
var l1 = solution.numberToListNode(number: 342)
var l2 = solution.numberToListNode(number: 465)
solution.addTwoNumbers(l1, l2)

//: [Next](@next)
