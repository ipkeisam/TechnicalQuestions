//: Swift Binary Tree Level Order Traversal

import UIKit

class Node<T> {
    var value: T
    var next: Node?
    
    init(value: T) {
        self.value = value
    }
}

func createLinkedList1() -> Node<Int> {
    let root = Node<Int>(value: 1)
    root.next = Node<Int>(value: 2)
    root.next?.next = Node<Int>(value: 3)
    root.next?.next?.next = Node<Int>(value: 4)
    root.next?.next?.next?.next = Node<Int>(value: 5)
    return root
}

func createLinkedList2() -> Node<Int> {
    let root = Node<Int>(value: 4)
    root.next = Node<Int>(value: 5)
    root.next?.next = Node<Int>(value: 6)
    root.next?.next?.next = Node<Int>(value: 7)
    root.next?.next?.next?.next = Node<Int>(value: 8)
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
        result?.next = merge (a?.next, b)
    }
    else {
        result = b
        if ((a?.value)! == (b?.value)!) {
            result?.next = merge(a?.next, b?.next)
        }
        else {
            result?.next = merge(a, b?.next)
        }
    }
    return result
}

func intersect(_ a : Node<Int>?, _ b : Node<Int>?) -> Node<Int>? {
    if (a == nil || b == nil) {
        return nil
    }
    
    if ((a?.value)! < (b?.value)!){
        return intersect(a?.next, b)
    }
    
    if ((a?.value)! > (b?.value)!) {
        return intersect(a, b?.next)
    }
    
    let temp = Node<Int>(value: (a?.value)!)
    temp.next = intersect(a?.next, b?.next)
    return temp
}

func printLinkedList(_ root : Node<Int>?) {
    
    var temp = root
    while (temp != nil) {
        print(temp?.value)
        temp = temp?.next
    }
}

printLinkedList(merge(createLinkedList1(), createLinkedList2()))
print("-----")
printLinkedList(intersect(createLinkedList1(), createLinkedList2()))
