//: [Previous](@previous)

import Foundation
import XCTest







//enum RelativeDirection {
//    case right
//    case down
//    case left
//    case up
//}
//enum RotationDirection {
//    case clockwise
//    case antiClockwise
//
//}
//
//struct Spiral {
//    let rotationDirection: RotationDirection
//    let startingDirection: RelativeDirection
//
//    private var circularTravelDirections: [RelativeDirection] {
//        switch rotationDirection {
//        case .clockwise: return [.right, .down, .left, .up]
//        case .antiClockwise: return [.left, .down, .right, .up]
//        }
//    }
//    var actualTravelDirection: [RelativeDirection] {
//        var directions = self.circularTravelDirections
//        let startDirectionIndex = directions.index(of: self.startingDirection)!
//        return Array(directions[startDirectionIndex...] + directions[..<startDirectionIndex])
//    }
//}
//
//let direction = Spiral(rotationDirection: .clockwise, startingDirection: .left)
//direction.actualTravelDirection

let partOne: ((Int) -> Int) = { input -> Int in
    var currentPosition: CGPoint = .zero
    var rightDirection = 0
    var upDirection = 0
    var leftDirection = 0
    var downDirection = 0
    var edgeCount = 1
    var innerCounter = 0
    for i in 0..<input {
        if innerCounter < edgeCount {
            innerCounter += 1
            currentPosition = CGPoint(x: currentPosition.x + 1, y: currentPosition.y)
        }
        else if innerCounter < edgeCount * 2 {
            innerCounter += 1
            currentPosition  = CGPoint(x: currentPosition.x, y: currentPosition.y + 1)
            return
        }
        else if innerCounter < edgeCount + 1 {
            innerCounter += 1
            currentPosition = CGPoint(x: currentPosition.x + 1, y: currentPosition.y)
        }
        else if innerCounter < (edgeCount + 1) * 2 {
            innerCounter += 1
            currentPosition  = CGPoint(x: currentPosition.x, y: currentPosition.y + 1)
        }
//        if rightDirection < edgeCount {
//            rightDirection += 1
//            currentPosition = CGPoint(x: edgeCount, y: currentPosition.y)
//        }
//        else if upDirection == edgeCount {
//            upDirection += 1
//            currentPosition = CGPoint(x: currentPosition.x, y: -edgeCount)
//        }
//        else if leftDirection == i - 2 {
//            edgeCount += 1
//            currentPosition = CGPoint(x: -i-1, currentPosition.y)
//        }
//        else if downDirection == i - 3 {
//            currentPosition = CGPoint(x: -i-1, currentPosition.y)
//        }
    }
//    return
    return 0
}



//XCTAssertEqual(partOne(1), 0)
//XCTAssertEqual(partOne(12), 3)
//XCTAssertEqual(partOne(23), 2)
//XCTAssertEqual(partOne(1024), 31)


