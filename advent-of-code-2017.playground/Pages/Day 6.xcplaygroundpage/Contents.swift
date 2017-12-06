//: [Previous](@previous)

import Foundation
import XCTest

let memoryBanks = content("input").split(separator: "\n").flatMap{ $0.split(separator: "\t") }.flatMap { Int.init($0) }

var testMemoryBanks = [0, 2, 7, 0]
var testAnswer = memoryReallocation(testMemoryBanks)
var testMemoryBanksTwo = testAnswer.finalArray
XCTAssertEqual(testAnswer.cycleCount, 5)
XCTAssertEqual(memoryAllocation(testMemoryBanksTwo).cycleCount, 5)

let answerToPartOne = memoryReallocation(memoryBanks)
let answerToPartTwo = memoryReallocation(answerToPartOne.finalArray)

print("Answer to part one: \(answerToPartOne)")
print("Answer to part two: \(answerToPartTwo)")


