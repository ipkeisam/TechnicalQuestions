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
    root.next = Node<Int>(value: 1)
    root.next?.next = Node<Int>(value: 2)
    root.next?.next?.next = Node<Int>(value: 3)
    root.next?.next?.next?.next = Node<Int>(value: 3)
    return root
}

func removeDupliactes(_ head : Node<Int>?) -> Node<Int>? {
    var current = head
    var next = head
    
    if (head == nil) {
        return head
    }
    
    while (current?.next != nil) {
        if (current?.value == current?.next?.value){
            next = current?.next?.next
            current?.next = next
        }
        else {
            current = current?.next
        }
    }
    
    return head
}

func printLinkedList(_ head : Node<Int>?) {
    
    var current = head
    while (current != nil) {
        print(current?.value)
        current = current?.next
    }
}

printLinkedList(removeDupliactes(createLinkedList()))
