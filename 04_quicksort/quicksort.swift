import Foundation

func quicksort(_ array : [Int]) -> [Int] {
    if (array.count < 2) {
        return array
    } else {
        let pivot = array[0]
        print("pivot \(pivot)")
        // подмассив всех элементов, меньших, чем опорный элемент
        let less = array.filter { $0 < pivot }
        print("less \(less)")
        // подмассив всех элементов, равных опорному элементу
        let equal = array.filter { $0 == pivot }
        print("equal \(equal)")
        // подмассив всех элементов больше чем опорный элемент
        let greater = array.filter { $0 > pivot}
        print("greater \(greater)")
        return quicksort(less) + equal + quicksort(greater)
    }
}

print([2, 4, 6, 8, 10, 1, 3, 5])
print(quicksort([2, 4, 6, 8, 10, 1, 3, 5]))
