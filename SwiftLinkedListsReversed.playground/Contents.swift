//: Swift Binary Tree Level Order Traversal

import UIKit

class Node<T> {
    var value: T
    var next: Node?
    
    init(value: T) {
        self.value = value
    }
}

func createLinkedList() -> Node<Int> {
    let root = Node<Int>(value: 1)
    root.next = Node<Int>(value: 2)
    root.next?.next = Node<Int>(value: 3)
    root.next?.next?.next = Node<Int>(value: 4)
    root.next?.next?.next?.next = Node<Int>(value: 5)
    return root
}

func printReverse(_ head : Node<Int>?) {
    if (head == nil) {
        return
    }
    
    printReverse(head?.next)
    print(head?.value)
}

printReverse(createLinkedList())
