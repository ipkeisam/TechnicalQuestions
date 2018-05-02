//: Swift Binary Tree Level Order Traversal

import UIKit

class Node<T> {
    var value: T
    var right: Node?
    var down: Node?
    
    init(value: T) {
        self.value = value
    }
}

func createLinkedList() -> Node<Int> {
    let root = Node<Int>(value: 1)
    root.down = Node<Int>(value: 4)
    root.down?.down = Node<Int>(value: 7)
    root.right = Node<Int>(value: 2)
    root.right?.down = Node<Int>(value: 5)
    root.right?.down?.down = Node<Int>(value: 8)
    root.right?.right = Node<Int>(value: 3)
    root.right?.right?.down = Node<Int>(value: 6)
    root.right?.right?.down?.down = Node<Int>(value: 9)
    return root
}


func merge(_ a : Node<Int>?, _ b : Node<Int>?) -> Node<Int>? {
    if (a == nil) {
        return b
    }
    
    if (b == nil){
        return a
    }
    
    var result : Node<Int>?
    
    if ((a?.value)! < (b?.value)!) {
        result = a
        result?.down = merge (a?.down, b)
    }
    else {
        result = b
        result?.down = merge(a, b?.down)
    }
    return result
}

func flatten(_ root : Node<Int>?) -> Node<Int>?{
    var temp = root
    if (temp == nil || temp?.right == nil) {
        return root
    }
    
    temp?.right = flatten(temp?.right)
    temp = merge(temp, temp?.right)
    
    return temp
}

func printLinkedList(_ root : Node<Int>?) {
    
    var temp = root
    for i in 1...10 {
        print(temp?.value)
        temp = temp?.down
    }
}

printLinkedList(flatten(createLinkedList()))


