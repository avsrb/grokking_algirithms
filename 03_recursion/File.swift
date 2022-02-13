import Foundation

func countDown(i : Int) {
    if i <= 0 {
        return
    } else {
        countDown(i: i-1)
    }
}

func fact(x: Int) -> Int {
    if x == 1 {
        return 1
    } else {
        return x*fact(x: x-1)
    }
}


print(fact(x: 5))
print(countDown(i: 5))


