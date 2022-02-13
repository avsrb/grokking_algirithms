import Foundation

func sum(arr: [Int]) -> Int {
    var total:Int = 0
    for item in arr {
        total += item
    }
    return total
}


func sumRecursion(arr : [Int]) -> Int {
    if arr.count == 0 {
        return 0
    }
    var tmpArray = arr
    tmpArray.remove(at: 0)
    return arr[0] + sumRecursion(arr: tmpArray)
}


func countRecursion(arr : [Int]) -> Int {
    if arr.count == 0 {
        return 0
    }
    var tmpArray = arr
    tmpArray.remove(at: 0)
    return 1 + countRecursion(arr: tmpArray)
}


func findMax(arr: [Int]) -> Int {
    var max = arr[0]
    for i in arr {
        if (i > max) {
            max = i
        }
    }
    return max;
}


func findMaxRecursion(arr: [Int]) -> Int {
    if (arr.count == 1) {
        return arr[0]
    }
    if (arr.count == 2) {
        return arr[0] > arr[1] ? arr[0] : arr[1]
    }
    var tempArray = arr
    tempArray.remove(at: 0)
    let subMax = findMaxRecursion(arr: tempArray)
    return (arr[0] > subMax) ? arr[0] : subMax
}

print(sum(arr: [2, 4, 6, 8, 10, 1, 3, 5]))
print(sumRecursion(arr: [2, 4, 6, 8, 10, 1, 3, 5]))
print(countRecursion(arr: [2, 4, 6, 8, 10, 1, 3, 5]))
print(findMax(arr: [2, 4, 6, 8, 10, 1, 3, 5]))
print(findMaxRecursion(arr: [2, 4, 6, 8, 10, 1, 3, 5]))


