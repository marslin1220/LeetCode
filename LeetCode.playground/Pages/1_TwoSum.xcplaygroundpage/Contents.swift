//: [Previous](@previous)

//Given an array of integers, return indices of the two numbers such that they add up to a specific target.
//
//You may assume that each input would have exactly one solution, and you may not use the same element twice.
//
//Example:
//
//Given nums = [2, 7, 11, 15], target = 9,
//
//Because nums[0] + nums[1] = 2 + 7 = 9,
//return [0, 1].
//
//================================================
//
// 1. Transfer the array to a binary tree - O(n)
//   Node {
//     parentNode,
//     rightNode, // Great than or equal to parent
//     leftNode // Less than parent
//  }
// 3. Iterate one by one node - O(n)
// 4. and find the correspond node - O(log_n)
// The final complexity is O(n_log_n)

class Solution {
    
    var rootNode = Node()
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var currentNode: Node
        
        // Assign nums[0] as the root node
        rootNode.indexOfArray = 0
        rootNode.value = nums[0]
        
        // Create the tree from the root node
        for (index, value) in nums.enumerated() {
            
            if (index == 0) {
                continue
            }
            
            let newNode = Node()
            newNode.indexOfArray = index
            newNode.value = value
            
            let returnAnswer = findAddend(newNode, sum: target, rootNode: rootNode)
            if [] != returnAnswer {
                return returnAnswer
            }
            
            // Compare value from the root node
            currentNode = rootNode
            while true {
                // Return if match the target with the current node
                if value + currentNode.value == target {
                    if index < currentNode.indexOfArray {
                        return [index, currentNode.indexOfArray]
                    } else {
                        return [currentNode.indexOfArray, index]
                    }
                }
                
                if value < currentNode.value {
                    if nil != currentNode.leftNode {
                        currentNode = currentNode.leftNode!
                    } else {
                        currentNode.leftNode = newNode
                        break
                    }
                } else {
                    if nil != currentNode.rightNode {
                        currentNode = currentNode.rightNode!
                    } else {
                        currentNode.rightNode = newNode
                        break
                    }
                }
            }
        }
        
        // Traversal methods: pre-order walk (parent then children)
        return traversal(sum: target, currentNode: rootNode, rootNode: rootNode)
    }
    
    func traversal(sum: Int, currentNode: Node, rootNode: Node) -> [Int] {
        
        var returnAnswer: [Int]
        
        returnAnswer = findAddend(currentNode, sum: sum, rootNode: rootNode)
        if [] != returnAnswer {
            return returnAnswer
        } else {
            if currentNode.leftNode != nil {
                returnAnswer = traversal(sum: sum, currentNode: currentNode.leftNode!, rootNode: rootNode)
                if [] != returnAnswer {
                    return returnAnswer
                }
            }
            
            if currentNode.rightNode != nil {
                returnAnswer = traversal(sum: sum, currentNode: currentNode.rightNode!, rootNode: rootNode)
                if [] != returnAnswer {
                    return returnAnswer
                }
            }
        }
        
        return []
    }
    
    func findAddend(_ currentNode: Node, sum: Int, rootNode: Node) -> [Int] {
        // summand + addend = sum
        let addend = sum - currentNode.value
        var traversalNode = rootNode
        
        while true {
            if currentNode.indexOfArray == traversalNode.indexOfArray {
                continue
            }
            
            if traversalNode.value == addend {
                if traversalNode.indexOfArray < currentNode.indexOfArray {
                    return [traversalNode.indexOfArray, currentNode.indexOfArray]
                } else {
                    return [currentNode.indexOfArray, traversalNode.indexOfArray]
                }
            } else if traversalNode.value < addend {
                if nil != traversalNode.rightNode {
                    traversalNode = traversalNode.rightNode!
                    continue
                } else {
                    return []
                }
            } else {
                if nil != traversalNode.leftNode {
                    traversalNode = traversalNode.leftNode!
                    continue
                } else {
                    return []
                }
            }
        }
    }
}

class Node {
    var indexOfArray = -1
    var value = 0
    var rightNode: Node?
    var leftNode: Node?
}

let solution = Solution()
//solution.twoSum([3,2,4], 6)
solution.twoSum([0,4,3,0], 0)

//: [Next](@next)
