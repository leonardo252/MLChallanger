import Cocoa

var irisTest: [Iris] = []
var irisDataSet: [Iris] = []

var accuracy: Double = 0
var testAccuracy: Double = 0
var testRepetition: Double = 30

//################################################# KNN Implementation###################################################################################
//
//var knn = KNN(k: 12)
//knn.fit(data: irisArray)
////  knn.predict(toKnow: know)
//
//let k = 20
//for valueK in (1...k) {
//    knn.setK(value: valueK)
//    for _ in (0..<Int(testRepetition)) {
//        (irisDataSet, irisTest) = getDataAndTest(data: irisArray)
//
//        for testing in irisTest {
//
//            let result = knn.predict(toKnow: testing)
//            let nameIris = testing.irisClass
//            if result == nameIris {
//                testAccuracy+=1
//            }
//        }
//        accuracy+=testAccuracy/Double(irisTest.count)
////        print("The accuracy of test is \(testAccuracy/Double(irisTest.count)) %")
//        testAccuracy = 0
//    }
//
//    print("Total accuracy of KNN code is \(accuracy/testRepetition * 100) % for \(valueK)")
//    accuracy = 0
//}

//################################################# DMC Implementation ###################################################################################
//
//let dmc = DMC()
//dmc.fit(data: irisArray)
//
//for _ in (0..<Int(testRepetition)) {
//    (irisDataSet, irisTest) = getDataAndTest(data: irisArray)
//
//    for testing in irisTest {
//
//        let result = dmc.predict(toKnow: testing)
//        let nameIris = testing.irisClass
//        if result == nameIris {
//            testAccuracy+=1
//        }
//    }
//    accuracy+=testAccuracy/Double(irisTest.count)
////    print("The accuracy of test is \(testAccuracy/Double(irisTest.count)) %")
//    testAccuracy = 0
//}
//print("Total accuracy of DMC code is \(accuracy/testRepetition * 100) %")

//################################################# Perceptron Implementation ###############################################################################
/*
// R: 0 M: 1

//print(sonarData[0].debugDescription)

//let new = Array<Double>([Double](sonarData[0][0..<60]))
let new = Array<String>(sonarData[0][0..<60]).map( {Double($0)!})


print(new.count)

//print(sonarData[0][0..<60].debugDescription)
//print(Double.random(in: 1.0...2.0) * 1)
*/



var (dataSet, tests) = getDataSets(data: sonarData, numberOfTests: 64)

let perceptron = Perceptron(learnRateN: 0.30, nOfEntrance: 60, biasSignal: +1.0)

print(perceptron.learnByEra(data: dataSet, numberOfEra: 500))

print("Accuracy of the tests: \(perceptron.testePredict(data: tests) * 100) %")
print("Accuracy of the tests: \(perceptron.testePredictWithBestWeight(data: tests) * 100) %")

//print(perceptron.weight)
//print(perceptron.bestPercentage)
//print(perceptron.bestWeight)


(dataSet, tests) = getDataSets(data: sonarData, numberOfTests: 64)
print(perceptron.learnByEra(data: dataSet, numberOfEra: 500))
//print("Accuracy of the tests: \(perceptron.testePredict(data: tests) * 100) %")
//print("Accuracy of the tests: \(perceptron.testePredictWithBestWeight(data: tests) * 100) %")

(dataSet, tests) = getDataSets(data: sonarData, numberOfTests: 64)
print(perceptron.learnByEra(data: dataSet, numberOfEra: 500))
//print("Accuracy of the tests: \(perceptron.testePredict(data: tests) * 100) %")
//print("Accuracy of the tests: \(perceptron.testePredictWithBestWeight(data: tests) * 100) %")

(dataSet, tests) = getDataSets(data: sonarData, numberOfTests: 64)
print(perceptron.learnByEra(data: dataSet, numberOfEra: 500))
//print("Accuracy of the tests: \(perceptron.testePredict(data: tests) * 100) %")
//print("Accuracy of the tests: \(perceptron.testePredictWithBestWeight(data: tests) * 100) %")

(dataSet, tests) = getDataSets(data: sonarData, numberOfTests: 64)
print(perceptron.learnByEra(data: dataSet, numberOfEra: 500))
print("Accuracy of the tests: \(perceptron.testePredict(data: tests) * 100) %")
print("Accuracy of the tests: \(perceptron.testePredictWithBestWeight(data: tests) * 100) %")


/*
 //print(perceptron.weight)

//perceptron.learn(data: new, type: 0)


var right = 0
var wrong = 0

//for index in (0..<200) {
//    let variable = Array<String>(sonarData[index][0..<61]).map( {Double($0)!})
//
//    let value = abs(perceptron.learn(data: Array<Double>(variable[0..<60]), type: variable[60]))
//
//    if( value == 0.0) {
//        right+=1
//    } else if (value == 1){
//        wrong+=1
//    } else {
//        print("Error")
//    }
//}
//
//print("Right: \(right) Wrong: \(wrong)")


//right = 0
//wrong = 0
//
//var newSonarData = sonarData.shuffled()
//
//for index in (0..<200) {
//    let variable = Array<String>(newSonarData[index][0..<61]).map( {Double($0)!})
//
//    let value = abs(perceptron.learn(data: Array<Double>(variable[0..<60]), type: variable[60]))
//
//    if( value == 0.0) {
//        right+=1
//    } else if (value == 1){
//        wrong+=1
//    } else {
//        print("Error")
//    }
//}
//
//print("Right: \(right) Wrong: \(wrong)")


var percenteges: [Double] = []

for _ in (0..<250) {
    right = 0
    wrong = 0

    let newSonarData = sonarData.shuffled()

    for index in (0..<200) {
        let variable = Array<String>(newSonarData[index][0..<61]).map( {Double($0)!})
        
        let value = abs(perceptron.learn(data: Array<Double>(variable[0..<60]), type: variable[60]))
        
        if( value == 0.0) {
            right+=1
        } else if (value == 1){
            wrong+=1
        } else {
            print("Error")
        }
    }

    print("Right: \(right) Wrong: \(wrong) - Percentege: \(Double(right)/200)")
    percenteges.append(Double(right)/200)
    
}

print("Porcentagem maxima: \(percenteges.max())")
*/


/*
let (dataSet, tests) = getDataSets(data: irisStrings, numberOfTests: 36)

let perceptron = Perceptron(learnRateN: 0.10, nOfEntrance: 4, biasSignal: -1.0)

print(perceptron.learnByEra(data: dataSet, numberOfEra: 10))
//
let isCetosa: [String] = ["4.8", "3.1", "1.6", "0.2", "1"]
let isNotCetosa: [String] = ["6.4", "2.8", "5.6", "2.2", "0"]

print(perceptron.predict(data: isCetosa))
print(perceptron.predict(data: isNotCetosa))

print("Accuracy of the tests: \(perceptron.testePredict(data: tests))")

*/


/*
var right = 0
var wrong = 0
var percenteges: [Double] = []

*/
 
/*
for _ in (0..<50) {
    right = 0
    wrong = 0

    let newiris = irisStrings.shuffled()

    for index in (0..<150) {
        let variable = Array<String>(newiris[index][0..<5]).map( {Double($0)!})

        let value = abs(perceptron.learn(data: Array<Double>(variable[0..<4]), type: variable[4]))
        
        if( value == 0.0) {
            right+=1
        } else if (value == 1){
            wrong+=1
        } else {
            print("Error")
        }
    }

    print("Right: \(right) Wrong: \(wrong) - Percentege: \(Double(right)/150)")
    percenteges.append(Double(right)/150)
    
}

print("Porcentagem maxima: \(percenteges.max()!)")
*/
