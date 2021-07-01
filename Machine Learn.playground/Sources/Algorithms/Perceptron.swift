import Foundation

public class Perceptron {
    
    public var learnRate: Double = 0
    public var weight: [Double] = []
    public var numberOfEntrance: Int = 0
    public var biasSignal: Double = 1
    
    public var bestWeight: [Double] = []
    public var bestPercentage: Double = 0
    
    public init(learnRateN: Double, nOfEntrance: Int, biasSignal: Double) {
        self.learnRate = learnRateN
        self.numberOfEntrance = nOfEntrance
        self.biasSignal = biasSignal
        setWeightValues(entrances: numberOfEntrance)
    }
    
    public func learn(data: [Double], type: Double) -> Double{

        var arrayLearn = data
        arrayLearn.append(biasSignal)
        
        var activationU: Double = 0
        
        for index in (0..<arrayLearn.count) {
            activationU = activationU + (weight[index] * arrayLearn[index])
            
        }

        let valueY = getYValue(activation: activationU)
        
        let error = type - valueY
        
        weight = updateWeight(data: arrayLearn, error: Double(error))
        
        return error
    }
    
    public func learnByEra(data: [[String]], numberOfEra: Int) -> Double{
        
        var percenteges: Double = 0
        
        for _ in (0..<numberOfEra) {
            var right = 0
            let newData = data.shuffled()
            
            for index in (0..<data.count) {
                let variable = Array<String>(newData[index][0...numberOfEntrance]).map( {Double($0)!})

                let value = abs(learn(data: Array<Double>(variable[0..<numberOfEntrance]), type: variable[numberOfEntrance]))
                if( value == 0.0) {
                    right+=1
                }
                
            }

            percenteges+=(Double(right)/Double(data.count))
            if (bestPercentage < (Double(right)/Double(data.count))) {
                bestPercentage = (Double(right)/Double(data.count))
                bestWeight = weight
            }

        }
                
        return percenteges/Double(numberOfEra)
    }
    
    public func predict(data: [String]) -> Double {
        var activationU: Double = 0
        
        let doubleValues = Array<String>(data[0...numberOfEntrance]).map( {Double($0)!})
        
        var values = Array<Double>(doubleValues[0..<numberOfEntrance])
        values.append(biasSignal)
    
        for index in (0..<values.count) {
            activationU = activationU + (weight[index] * values[index])
            
        }
        
        let valueY = getYValue(activation: activationU)
        
        return valueY
    }
    
    public func predictWithBest(data: [String]) -> Double{
        var activationU: Double = 0
        
        let doubleValues = Array<String>(data[0...numberOfEntrance]).map( {Double($0)!})
        
        var values = Array<Double>(doubleValues[0..<numberOfEntrance])
        values.append(biasSignal)
    
        for index in (0..<values.count) {
            activationU = activationU + (bestWeight[index] * values[index])
            
        }
        
        let valueY = getYValue(activation: activationU)
        
        return valueY
    }
    
    public func testePredict(data: [[String]]) -> Double {
     
        var right = 0
        for element in data {
            
            let predicResult = predict(data: element)
            if (predicResult == Double(element[numberOfEntrance])) {
                right+=1
            }
//            print("Result: \(predicResult) Predict: \(Double(element[numberOfEntrance])!)")
        }
        
        return Double(right)/Double(data.count)
    }
    
    public func testePredictWithBestWeight(data: [[String]]) -> Double {
     
        var right = 0
        
        for element in data {
            
            if (predictWithBest(data: element) == Double(element[numberOfEntrance])) {
                right+=1
            }
        }
        
        return Double(right)/Double(data.count)
    }
    
    func setWeightValues(entrances: Int) {
        for _ in (0..<entrances) {
            weight.append(1)
        }
        weight.append(1.0)
//        weight.append(1.0 * (Double.random(in: (0.0..<10.0))))
    }
    
    func updateWeight(data: [Double], error: Double) -> [Double]{
        var newWeight: [Double] = []
        
        for index in (0..<weight.count) {
            newWeight.append(weight[index] + learnRate * error * data[index])
        }
        
        return newWeight
    }
    
    func getYValue(activation: Double) -> Double {
        
        if activation <= 0 {
            return 0
        } else if activation > 0 {
            return 1
        }
        
        return 0
    }
    
}
