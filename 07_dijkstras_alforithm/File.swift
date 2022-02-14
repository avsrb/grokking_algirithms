import Foundation

// the graph
//создаем хеш-таблицу которая содержит другие хеш-таблицы
var graph =  [String : [String: Double]] ()
graph["start"] = [String: Double]()
graph["start"]?["a"] = 6
graph["start"]?["b"] = 2
print("Веса ребер а и б \n\(graph)")

graph["a"] = [String: Double]()
graph["a"]?["fin"] = 1

graph["b"] = [String: Double]()
graph["b"]?["a"] = 3
graph["b"]?["fin"] = 5

graph["fin"] = [String: Double]()
print("Полная хеш-таблица графа \n\n\(graph)")

// Хеш-таблица стоимости
let infinity = Double.infinity
var costs = [String: Double]()
costs["a"] = 6
costs["b"] = 2
costs["fin"] = infinity
print(" \n\(costs)")


// Хеш-таблица Родителей
var parents = [String: String]()
parents["a"] = "start"
parents["b"] = "start"
parents["fin"] = nil

//Массив для отслеживания обработанных узлов
var processed = [String]()

func findLowestCostNode(costs: [String: Double]) -> [String: Double] {
    var lowestCost = Double.infinity //бесконечность
    var lowestCostNode = [String: Double]()
    for node in costs {
        let cost = node.value
        // Если узел с наименьшей стоимостью из уже виденных и он не был обработан ...
        if (cost < lowestCost) && !processed.contains(node.key) {
            // ... он назначается новым узлом с наименьшей стоимостью
            lowestCost = cost
            lowestCostNode = [node.key : node.value]
        }
    }
    return lowestCostNode
}

// Находим узел с наименьшей стоимостью
var node = findLowestCostNode(costs: costs)

// пока все узлы необработаны
while !node.isEmpty {
    var nodeFirstKey = node.first?.key
    var cost = costs[nodeFirstKey!]
    // Go through all the neighbors of this node.
    var neighbors = graph[nodeFirstKey!]
    // перебор всех соседей текушего узла
    for n in (neighbors?.keys)! {
        var newCost = cost! + (neighbors?[n])!
        // У каждого узла есть стоимость, которая определяет, сколько времени потребуется для достижения этого узла от начала
        // Если к соседу можно добраться быстрее, то обнавить стоимость этого узла
        if costs[n]! > newCost {
            // Обнавляем стоимость
            costs[n] = newCost
            // этот узел становиться новым родителем для соседа
            parents[n] = nodeFirstKey
        }
    }
    // Узел помечается как обработанный
    processed.append(nodeFirstKey!)
    // найти следующий узел для обработки и повторить цикл
    node = findLowestCostNode(costs: costs)
}


print("Cost from the start to each node:")
print(costs) // -> ["b": 2.0, "fin": 6.0, "a": 5.0]

