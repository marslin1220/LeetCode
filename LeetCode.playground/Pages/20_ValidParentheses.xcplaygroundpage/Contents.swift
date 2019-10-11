//: [Previous](@previous)

// Q: https://leetcode.com/problems/valid-parentheses/

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
