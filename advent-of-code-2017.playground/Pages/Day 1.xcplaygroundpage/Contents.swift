//: Playground - noun: a place where people can play

import UIKit
import Foundation
import XCTest
import CoreLocation

let input = content("input")

var processReverseCaptchaSum: ((String, Int) -> Int) = {
    var sum: Int = 0
    var captcha = $0.map(String.init)
    print(captcha)
    for (index, character) in $0.enumerated() {
        guard character == captcha[(index + $1) % captcha.count] else { continue }
        sum += Int(character)!
    }
    return sum
}

var p1: ((String) -> Int) = {
    return processReverseCaptchaSum($0, 1)
}
var p2: ((String) -> Int) = {
    return processReverseCaptchaSum($0, $0.count/2)
}

let answerToPartOne = p1(input)
let answerToPartTwo = p2(input)

print("Answer to part one: \(answerToPartOne)")
print("Answer to part two: \(answerToPartTwo)")

