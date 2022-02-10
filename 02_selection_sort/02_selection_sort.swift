import Foundation

func findSmallest(_ array: [Int]) -> Int {
    var smallest = array[0]
    var smallestIndex = 0
    for i in 1..<array.count {
        if array[i] < smallest {
            smallest = array[i]
            smallestIndex = i
        }
    }
    return smallestIndex
}


func selectionSort(array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }

    var newArray: [Int] = []

    var mutableArr = array
    for _ in 0..<mutableArr.count {
        let smallestIndex = findSmallest(mutableArr)
        newArray.append(mutableArr.remove(at: smallestIndex))
        print("mutableArr: \(mutableArr)")
        print("newArray: \(newArray)")
    }
    return newArray
}

print(selectionSort(array: [5, 3, 6, 2, 10]))
