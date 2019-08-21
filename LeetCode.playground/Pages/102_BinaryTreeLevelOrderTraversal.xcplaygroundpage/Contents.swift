//: [Previous](@previous)

// 102. Binary Tree Level Order Traversal
// Q: https://leetcode.com/problems/binary-tree-level-order-traversal/

import XCTest

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let rootNode = root else { return [] }

        var subNodes = [rootNode]
        var result = [[rootNode.val]]

        while subNodes.count != 0 {
            var currentSubNodes = [TreeNode]()
            var currentValues = [Int]()
            for node in subNodes {
                if let leftNode = node.left {
                    currentSubNodes.append(leftNode)
                    currentValues.append(leftNode.val)
                }

                if let rightNode = node.right {
                    currentSubNodes.append(rightNode)
                    currentValues.append(rightNode.val)
                }
            }

            subNodes = currentSubNodes
            if currentValues.count > 0 {
                result.append(currentValues)
            }
        }

        return result
    }
}

class MyTests: XCTestCase {
}

TestRunner().runTests(testClass: MyTests.self)

//: [Next](@next)
