//: [Previous](@previous)

import Foundation
import XCTest

typealias Grid = [[Int]]

let partOne: ((Grid) -> Int) = { grid -> Int in
    var checkSumTotal = 0
    grid.forEach { row in
        guard let firstColumnValue = row.first else { return }
        var minValue: Int = firstColumnValue
        var maxValue = minValue
        var maxDifference: Int = 0
        row.forEach { currentValue in
            minValue = min(minValue, currentValue)
            maxValue = max(maxValue, currentValue)
            maxDifference = maxValue - minValue
        }
        checkSumTotal += maxDifference
    }
    return checkSumTotal
}

let partTwo: ((Grid) -> Int) = { grid -> Int in
    var checkSumTotal = 0
    var carryForward = 0
    grid.forEach { row in
        for i in 0..<row.count {
            for j in 0..<row.count {
                guard i != j else { continue }
                let maxValue = max(row[i], row[j])
                let smallValue = min(row[i], row[j])
                guard maxValue % smallValue == 0 else { continue }
                carryForward = maxValue/smallValue
                break
            }
        }
        checkSumTotal += carryForward
    }
    return checkSumTotal
}


XCTAssertEqual(partOne([[5, 1, 9, 5]]), 8)
XCTAssertEqual(partOne([[7, 5, 3]]), 4)
XCTAssertEqual(partOne([[2, 4, 6, 8]]), 6)
XCTAssertEqual(partOne([[5, 1, 9, 5], [7, 5, 3], [2, 4, 6, 8]]), 18)


XCTAssertEqual(partTwo([[5, 9, 2, 8]]), 4)
XCTAssertEqual(partTwo([[9, 4, 7, 3]]), 3)
XCTAssertEqual(partTwo([[4, 8, 6, 5]]), 2)
XCTAssertEqual(partTwo([[5, 9, 2, 8],[9, 4, 7, 3],[4, 8, 6, 5]]), 9)




let fileURL = Bundle.main.url(forResource: "input", withExtension: "txt")
let content = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)
let grid = Array(content.split(separator: "\n")).map{ $0.split(separator: "\t").flatMap {Int($0)}}

print(partOne(grid))
print(partTwo(grid))
