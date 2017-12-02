//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import XCTest


class DayOneTests: XCTestCase {
    var challenge: ChallengeAcceptable!
    
    func testPartOneResultCases(){
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
    
    func testPartTwoResultCases(){
        let challenge = DayOneInverseCaptcha()
        challenge.input = "1212"
        challenge.processPartTwo {
            XCTAssertEqual("6", $0)
        }
        
        challenge.input = "1221"
        challenge.processPartTwo {
            XCTAssertEqual("0", $0)
        }
        
        challenge.input = "123425"
        challenge.processPartTwo {
            XCTAssertEqual("4", $0)
        }
        
        challenge.input = "123123"
        challenge.processPartTwo {
            XCTAssertEqual("12", $0)
        }
        challenge.input = "12131415"
        challenge.processPartTwo {
            XCTAssertEqual("4", $0)
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
    
    func processPartTwo(_ onComplete: ((String) -> Void)) {
        let sum = self.processReverseCaptchaSum(skipCount: self.input.count/2)
        onComplete("\(sum)")
    }
    private func processReverseCaptchaSum(skipCount: Int) -> Int {
        var sum: Int = 0
        var input: [String] = self.input.map(String.init)
        for (index, character) in input.enumerated() {
            guard character == input[(index + skipCount) % input.count] else { continue }
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
dayOnePartOne.processPartTwo {
    print("answer \($0)")
}


