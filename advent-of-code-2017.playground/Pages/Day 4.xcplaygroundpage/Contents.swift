//: [Previous](@previous)

import Foundation

let passphrases = content("input").split(separator: "\n").map{ $0.split(separator: " ")}.map(String.init)
print(passphrases)


let p1: (([[String]]) -> Int) = { $0.filter { Set($0).count == $0.count }.count }
//
//let p2: (([[String]]) -> Int) = { $0.filter { Set($0.map { String($0.sorted()) }).count == $0.map {String($0.sorted())}.count }.count }
//
//let answerToPartOne = p1(passphrases)
//print(answerToPartOne)
//let answerToPartTwo = p2(passphrases)
//print(answerToPartTwo)

