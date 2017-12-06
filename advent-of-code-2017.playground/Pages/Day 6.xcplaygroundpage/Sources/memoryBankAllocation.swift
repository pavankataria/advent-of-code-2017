import Foundation


public var memoryReallocation: (([Int]) -> (cycleCount: Int, finalArray: [Int])) = {
    var stillFinding = true
    var memoryBanks = $0
    var memoryBankCount: Int = memoryBanks.count
    var hashes: Set<Int> = Set<Int>()
    
    var counter = 0
    while stillFinding {
        let result = hashes.insert("\(memoryBanks)".hashValue)
        if !result.inserted {
            stillFinding = false
            break;
        }
        
        let maxElement: Int = memoryBanks.index(of: memoryBanks.max()!)!
        let value: Int = memoryBanks[maxElement]
        memoryBanks[maxElement] = 0
        let totalOvertakes: Int = Int(Float(value)/Float(memoryBankCount))
        let remainder: Int = value % memoryBankCount
        if totalOvertakes > 0 {
            memoryBanks = memoryBanks.map { $0 + totalOvertakes }
        }
        for i in 0..<remainder {
            memoryBanks[(maxElement+i+1) % memoryBankCount] += 1
        }
        counter += 1
    }
    return (counter, memoryBanks)
}
