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

func createLinkedList2(_ root : Node<Int>?) -> Node<Int> {
    let root2 = Node<Int>(value: 11)
    root2.next = Node<Int>(value: 12)
    root2.next?.next = Node<Int>(value: 13)
    root2.next?.next?.next = root?.next?.next
    return root2
}

func length(_ a : Node<Int>?) -> Int {
    var current = a
    var count = 0
    
    while (current != nil) {
        count = count + 1
        current = current?.next
    }
    return count
}

func getNode(_ head1 : Node<Int>?, _ head2 : Node<Int>?) -> Int {
    let c1 = length(head1)
    let c2 = length(head2)
    
    if (c1 > c2) {
        return getIntersectionNode(c1 - c2, head1, head2)
    }
    else {
        return getIntersectionNode(c2 - c1, head2, head1)
    }
}

func getIntersectionNode(_ d : Int, _ head1 : Node<Int>?, _ head2 : Node<Int>?) -> Int {
    var current1 = head1
    var current2 = head2
    
    for i in 0..<d {
        current1 = current1?.next
    }
    
    while (current1 != nil && current2 != nil){
        if (current1?.value == current2?.value){
            return (current1?.value)!
        }
        current1 = current1?.next
        current2 = current2?.next
    }
    
    return 0
}

let head1 = createLinkedList()
let head2 = createLinkedList2(head1)
getNode(head1, head2)


