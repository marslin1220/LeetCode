//: [Previous](@previous)

//Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
//
//An input string is valid if:
//
//Open brackets must be closed by the same type of brackets.
//Open brackets must be closed in the correct order.
//Note that an empty string is also considered valid.
//
//Example 1:
//```
//Input: "()"
//Output: true
//```
//
//Example 2:
//
//```
//Input: "()[]{}"
//Output: true
//```
//
//Example 3:
//
//```
//Input: "(]"
//Output: false
//```
//
//Example 4:
//
//```
//Input: "([)]"
//Output: false
//```
//
//Example 5:
//
//```
//Input: "{[]}"
//Output: true
//```


import XCTest

class Solution {
    func isValid(_ s: String) -> Bool {
        var parenthesesStack = [Character]()

        for char in s {
            switch char {
            case "(", "[", "{":
                parenthesesStack.append(char)
            case ")":
                if parenthesesStack.isEmpty || parenthesesStack.removeLast() != "(" {
                    return false
                }
            case "]":
                if parenthesesStack.isEmpty || parenthesesStack.removeLast() != "[" {
                    return false
                }
            case "}":
                if parenthesesStack.isEmpty || parenthesesStack.removeLast() != "{" {
                    return false
                }
            default:
                break
            }
        }

        return parenthesesStack.isEmpty
    }
}

class MyTests : XCTestCase {
    func test1() {
        XCTAssertEqual(Solution().isValid("()"), true)
    }

    func test2() {
        XCTAssertEqual(Solution().isValid("()[]{}"), true)
    }

    func test3() {
        XCTAssertEqual(Solution().isValid("(]"), false)
    }

    func test4() {
        XCTAssertEqual(Solution().isValid("([)]"), false)
    }

    func test5() {
        XCTAssertEqual(Solution().isValid("{[]}"), true)
    }

    func testException1() {
        XCTAssertEqual(Solution().isValid("]"), false)
    }

    func testException2() {
        XCTAssertEqual(Solution().isValid("["), false)
    }
}

TestRunner().runTests(testClass: MyTests.self)

//: [Next](@next)
