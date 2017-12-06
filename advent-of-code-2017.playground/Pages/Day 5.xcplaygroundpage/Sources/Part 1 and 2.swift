import Foundation

public var twistyTrampoline: (([Int], _ skipCountHandler: ((Int) -> Int)) -> Int) = {
    var array: [Int] = $0
    var index = 0
    var counter = 0
    while index < array.count {
        let currentValue = array[index]
        array[index] = $1(currentValue)
        index = index + currentValue
        counter += 1
    }
    return counter
}
public var p1: (([Int]) -> Int) = {
    return twistyTrampoline($0){
        return $0+1
    }
}
public var p2: (([Int]) -> Int) = {
    return twistyTrampoline($0){
        return $0 >= 3 ? $0-1 : $0+1
    }
}
