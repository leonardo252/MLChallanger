import Foundation

public func getDataAndTest(data: [Iris]) -> ([Iris], [Iris]) {
    
    var dataSet: [Iris] = data
    var test: [Iris] = []
    
    for _ in (0..<36) {
        let randon = Int.random(in: 0..<dataSet.count)
        test.append(dataSet[randon])
        dataSet.remove(at: randon)
    }
    
    return (dataSet,test)
}

public func getDataSets(data: [[String]], numberOfTests: Int) -> ([[String]], [[String]]) {
    
    var dataSet: [[String]] = data
    var test: [[String]] = []
    
    for _ in (0..<numberOfTests) {
        let randon = Int.random(in: 0..<dataSet.count)
        test.append(dataSet[randon])
        dataSet.remove(at: randon)
    }
    
    return(dataSet, test)
}
