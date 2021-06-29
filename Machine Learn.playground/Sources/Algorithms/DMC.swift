import Foundation

public class DMC {
    var ctrdSeto: Iris = Iris(seLength: 0, seWidth: 0, peLength: 0, peWidth: 0, irisClass: "Iris-setosa")
    var quantiSeto: Double = 0
    var ctrdVersi: Iris = Iris(seLength: 0, seWidth: 0, peLength: 0, peWidth: 0, irisClass: "Iris-versicolor")
    var quantiVersi: Double = 0
    var ctrdVirgi: Iris = Iris(seLength: 0, seWidth: 0, peLength: 0, peWidth: 0, irisClass: "Iris-virginica")
    var quantiVirgi: Double = 0
    
    public init() {
        
    }
    
    public func fit(data: [Iris]) {
        
        for irs in data {
            if irs.irisClass == "Iris-setosa" {
                ctrdSeto.seLength+=irs.seLength
                ctrdSeto.seWidth+=irs.seWidth
                ctrdSeto.peLength+=irs.peLength
                ctrdSeto.peWidth+=irs.peWidth
                quantiSeto+=1
            }else if irs.irisClass == "Iris-versicolor" {
                ctrdVersi.seLength+=irs.seLength
                ctrdVersi.seWidth+=irs.seWidth
                ctrdVersi.peLength+=irs.peLength
                ctrdVersi.peWidth+=irs.peWidth
                quantiVersi+=1
            }else if irs.irisClass == "Iris-virginica" {
                ctrdVirgi.seLength+=irs.seLength
                ctrdVirgi.seWidth+=irs.seWidth
                ctrdVirgi.peLength+=irs.peLength
                ctrdVirgi.peWidth+=irs.peWidth
                quantiVirgi+=1
            }
        }

        ctrdSeto = getMedia(data: ctrdSeto, quanti: quantiSeto)
        ctrdVersi = getMedia(data: ctrdVersi, quanti: quantiVersi)
        ctrdVirgi = getMedia(data: ctrdVirgi, quanti: quantiVirgi)

    }
    
    public func predict(toKnow: Iris) -> String {
        var distances: [Double] = []
        distances.append(EuclidianDistance(x1: toKnow, x2: ctrdSeto))
        distances.append(EuclidianDistance(x1: toKnow, x2: ctrdVersi))
        distances.append(EuclidianDistance(x1: toKnow, x2: ctrdVirgi))
        
        let mim = distances.min()
        
        if distances[0] == mim {
            return "Iris-setosa"
        } else  if distances[1] == mim {
            return "Iris-versicolor"
        } else if distances[2] == mim {
            return "Iris-virginica"
        }
        return "Error"
    }
    
    private func EuclidianDistance(x1: Iris, x2: Iris) -> Double {
        let seL = pow((x1.seLength - x2.seLength), 2)
        let seW = pow((x1.seWidth - x2.seWidth), 2)
        let peL = pow((x1.peLength - x2.peLength), 2)
        let peW = pow((x1.peWidth - x2.peWidth), 2)
        
        return sqrt(seL + seW + peL + peW)
    }
    
    private func getMedia(data: Iris, quanti: Double) -> Iris {
        
        let newIris = Iris(seLength: data.seLength/quanti, seWidth: data.seWidth/quanti, peLength: data.peLength/quanti, peWidth: data.peWidth/quanti, irisClass: data.irisClass)
        return newIris
        
    }
    
}
