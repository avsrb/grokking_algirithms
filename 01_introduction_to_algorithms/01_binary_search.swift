import Foundation

func binarySearch(list :[Int], item: Int) -> Int {
    var low = 0
    var high = list.count - 1
    while (low <= high) {
        let mid = (low + high)/2
        let guess = list[mid]
        if guess == item {
            return mid
        }
        if guess > item {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    return 0
}

var numbers: [Int] = [1, 2, 3, 4, 5]

binarySearch(list:numbers, item:2)
