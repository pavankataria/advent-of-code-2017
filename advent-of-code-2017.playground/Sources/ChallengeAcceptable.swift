import Foundation

public protocol ChallengeAcceptable {
    func processInput()
    func processPartOne(onComplete: ((String) -> Void))
    func processPartTwo(onComplete: ((String) -> Void))
}

extension ChallengeAcceptable {
    public func processPartOne(onComplete: ((String) -> Void)) {
        print("challenge part one not yet implemented")
    }
    
    public func processPartTwo(onComplete: ((String) -> Void)) {
        print("challenge part two not yet implemented")
    }
}
