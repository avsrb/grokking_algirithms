import Foundation

//Список штатов
var statesNeeded : Set = ["mt", "wa", "or", "id", "nv", "ut", "ca", "az"]
//Список станций и тех штатов которые они охватывают
var stations = [String: Set<String>]()
stations["kone"] = ["id", "nv", "ut"]
stations["ktwo"] = ["wa", "id", "mt"]
stations["kthree"] = ["or", "nv", "ca"]
stations["kfour"] = ["nv", "ut"]
stations["kfive"] = ["ca", "az"]

var finalStations = Set<String>()

while !statesNeeded.isEmpty {
    var bestStation = String()
    // Множество statesCovered, содержит все штаты обслуживаемые этой станцией, которые не входят в текущее покрытие
    var statesCovered = Set<String>()
    // Перебераем все станции и находим среди них лучшую
    
    for station in stations {
        // переменная covered хранит пересечение множеств
        var covered = statesNeeded.intersection(station.value)
        // сравниваем по кол-ву пересечении и выбираем лучшую
        if covered.count > statesCovered.count {
            bestStation = station.key
            statesCovered = covered
        }
        // вычетание, исключаем из множества statesNeeded элементы которые содержатся в statesCovered
        statesNeeded = statesNeeded.subtracting(statesCovered)
        //Swift note: We should avoid adding empty station to Set
        if !bestStation.isEmpty {
            finalStations.insert(bestStation)
        }
    }
}

print(finalStations.sorted())


//: [Next](@next)
