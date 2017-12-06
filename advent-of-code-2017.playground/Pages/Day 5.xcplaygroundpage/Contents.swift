//: [Previous](@previous)

import Foundation
import XCTest

let inputOffsets = content("input").split(separator: "\n").flatMap{ Int($0) }

var testOffsets = [0, 3, 0, 1, -3]
XCTAssertEqual(p1(testOffsets), 5)
XCTAssertEqual(p2(testOffsets), 10)

let answerToPartOne = p1(inputOffsets)
let answerToPartTwo = p2(inputOffsets)

print("Answer to part one: \(answerToPartOne)")
print("Answer to part two: \(answerToPartTwo)")
