//: [Previous](@previous)

// 79. Word Search
// Q: https://leetcode.com/problems/word-search/

import XCTest

class Solution {
    struct BoardIndex: Equatable {
        let row: Int
        let col: Int
    }

    func exist(_ board: [[Character]], _ word: String) -> Bool {
        if word.count == 0 {
            return true
        }

        // 1. find the first letter of the word
        for (rowIndex, row) in board.enumerated() {
            for colIndex in 0 ..< row.count {
                let currentIndex = BoardIndex(row: rowIndex, col: colIndex)
                if findTheWord(board, word, at: currentIndex, breadcrumb: [BoardIndex]()) {
                    return true
                }
            }
        }

        return false
    }

    private func findTheWord(_ board: [[Character]], _ word: String, at boardIndex: BoardIndex, breadcrumb: [BoardIndex]) -> Bool {
        if board[boardIndex.row][boardIndex.col] != word.first! {
            return false
        }

        if word.count == 1 {
            return true
        }

        var restWord = word
        restWord.removeFirst()

        var currentBreadcrumb = breadcrumb
        currentBreadcrumb.append(boardIndex)

        for toward in 0 ... 3 {
            guard let nextIndex = getNextIndex(from: boardIndex, to: toward, in: board) else {
                continue
            }

            if currentBreadcrumb.contains(nextIndex) {
                continue
            }

            if findTheWord(board, restWord, at: nextIndex, breadcrumb: currentBreadcrumb) {
                return true
            }
        }

        return false
    }

    private func getNextIndex(from index: BoardIndex, to toward: Int, in board: [[Character]]) -> BoardIndex? {
        switch toward {
        case 0: // up
            if index.row - 1 >= 0 {
                return BoardIndex(row: index.row - 1, col: index.col)
            }
        case 1: // right
            if index.col + 1 < board[index.row].count {
                return BoardIndex(row: index.row, col: index.col + 1)
            }
        case 2: // down
            if index.row + 1 < board.count {
                return BoardIndex(row: index.row + 1, col: index.col)
            }
        case 3: // left
            if index.col - 1 >= 0 {
                return BoardIndex(row: index.row, col: index.col - 1)
            }
        default:
            return nil
        }

        return nil
    }
}

class MyTests: XCTestCase {
    func test1() {
        XCTAssertTrue(Solution().exist([
            ["A", "B", "C", "E"],
            ["S", "F", "C", "S"],
            ["A", "D", "E", "E"],
        ], "ABCCED"))
    }

    func test2() {
        XCTAssertTrue(Solution().exist([
            ["A", "B", "C", "E"],
            ["S", "F", "C", "S"],
            ["A", "D", "E", "E"],
        ], "SEE"))
    }

    func test3() {
        XCTAssertFalse(Solution().exist([
            ["A", "B", "C", "E"],
            ["S", "F", "C", "S"],
            ["A", "D", "E", "E"],
        ], "ABCB"))
    }

    func test4() {
        XCTAssertTrue(Solution().exist([
            ["A", "B"],
            ["C", "D"],
        ], "ACDB"))
    }
}

TestRunner().runTests(testClass: MyTests.self)

//: [Next](@next)
