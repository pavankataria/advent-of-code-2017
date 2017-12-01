//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import XCTest


class DayOneTests: XCTestCase {
    var challenge: ChallengeAcceptable!
    
    func testPartOneOutputs3(){
        let challenge = DayOneInverseCaptcha()
        challenge.input = "1122"
        challenge.processPartOne {
            XCTAssertEqual("3", $0)
        }
        
        challenge.input = "1111"
        challenge.processPartOne {
            XCTAssertEqual("4", $0)
        }

        challenge.input = "1234"
        challenge.processPartOne {
            XCTAssertEqual("0", $0)
        }
        
        challenge.input = "91212129"
        challenge.processPartOne {
            XCTAssertEqual("9", $0)
        }
    }
}
class DayOneInverseCaptcha: ChallengeAcceptable, PathLoadable {
    var resourceName: String = "day-1-inverse-captcha"
    var type: String? = "txt"
    
    var input: String = ""
    var didComplete: (() -> Void)?
    
    init(){
        self.processInput()
    }
    func processInput(){
        let data = getInput()
        let input = String(data: data, encoding: .utf8)!
        self.input = input.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func processPartOne(_ onComplete: ((String) -> Void)) {
        let sum = self.processReverseCaptchaSum(skipCount: 1)
        onComplete("\(sum)")
    }
    
    private func processReverseCaptchaSum(skipCount: Int) -> Int {
        var sum: Int = 0
        var input: [String] = self.input.map(String.init)
        guard let firstChar = input.first else {
            return sum
        }
        //Copy the first character and append to the last.
        input.append(firstChar)
        for (index, character) in input.enumerated() where index < input.count-skipCount {
            guard character == input[index+1] else { continue }
            sum += Int(character)!
        }
        return sum
    }
}

DayOneTests.defaultTestSuite.run()
let dayOnePartOne = DayOneInverseCaptcha()
dayOnePartOne.processPartOne {
    print("answer \($0)")
}


