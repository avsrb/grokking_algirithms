import Foundation

// As I can see Swift doesn't have Queue default implementation, so we have to use custom on, Degue structure from Swift Algorithm Club
// https://github.com/raywenderlich/swift-algorithm-club/tree/master/Deque

public struct Deque<T> {
    private var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func enqueueFront(_ element: T) {
        array.insert(element, at: 0)
    }
    
    public mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    public mutating func dequeueBack() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeLast()
        }
    }
    
    public func peekFront() -> T? {
        return array.first
    }
    
    public func peekBack() -> T? {
        return array.last
    }
}

func persionIsSeller(name: String) -> Bool {
    return name.hasSuffix("m")
}

var graph = [String : [String]]()
graph["you"] = ["alice", "bob", "claire"]
graph["bob"] = ["anuj", "peggy"]
graph["alice"] = ["peggy"]
graph["claire"] = ["thom", "jonny"]
graph["anuj"] = []
graph["peggy"] = []
graph["thom"] = []
graph["jonny"] = []

func search(name: String) -> Bool {
    var searchQueue = Deque<String>()
    for string in graph[name]! {
        searchQueue.enqueue(string)
    }
    var searched = [String]() // Этот массив используется для отслеживания уже проверенных людей
    while !searchQueue.isEmpty {
        let person = searchQueue.dequeue()
        // ⬇️ человек проверятся только в том случае, если он не проверился ранее
        if !searched.contains(person!) {
            if persionIsSeller(name: person!) {
                print("\(person!) is a mango seller!")
                return true
            } else {
                for string in graph[person!]! {
                    searchQueue.enqueue(string)
                }
                searched.append(person!)
                    // Человек помечается как проверенный
            }
        }
    }
    
    return false
}

if search(name: "you") == false {
    print("Mango seller Not Found!")
} // => thom is a mango seller!

