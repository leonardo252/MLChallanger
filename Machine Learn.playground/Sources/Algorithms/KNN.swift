import Foundation

public class KNN {
    var k: Int = 3
    var dataTrain: [Iris] = []
    
    public init() {
    }
    
    public init(k: Int) {
        self.k = k
    }
    
    public func fit(data: [Iris]) {
        self.dataTrain = data
    }
    
    public func setK(value: Int) {
        self.k = value
    }
    
    public func predict(toKnow: Iris) -> String {
        var distances: [Double] = []
        var labels: [String] = []
        
        for x2 in dataTrain {
            distances.append(EuclidianDistance(x1: toKnow, x2: x2))
        }
        let arrayIndicesOrd = distances.enumerated().sorted(by: {
            $0.element < $1.element
        })
        
        let firstIndeices = arrayIndicesOrd[0..<k]
        
        for indexs in firstIndeices {
            labels.append(dataTrain[indexs.offset].irisClass)
        }
        
//          print(commonElementsInArrayUsingReduce(stringArray: labels))
        let result = commonElementsInArrayUsingReduce(stringArray: labels)
        return result
    }
    
    public func commonElementsInArrayUsingReduce(stringArray: [String]) -> String {
        let stringArray = stringArray.reduce(into: [:]) { (counts, strings) in
            counts[strings, default: 0] += 1
        }
        return stringArray.sorted(by: {$0.value > $1.value}).first?.key ?? ""
    }
    
    private func EuclidianDistance(x1: Iris, x2: Iris) -> Double {
        let seL = pow((x1.seLength - x2.seLength), 2)
        let seW = pow((x1.seWidth - x2.seWidth), 2)
        let peL = pow((x1.peLength - x2.peLength), 2)
        let peW = pow((x1.peWidth - x2.peWidth), 2)
        
        return sqrt(seL + seW + peL + peW)
    }
    
    
}
