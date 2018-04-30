//: Swift Binary Tree Level Order Traversal

import UIKit

struct Queue<T> {
    var list = [T]()
    
    mutating func enqueue(_ element: T) {
        list.append(element)
    }
    mutating func dequeue() -> T? {
        if !list.isEmpty {
            return list.removeFirst()
        } else {
            return nil
        }
    }
    func peek() -> T? {
        if !list.isEmpty {
            return list[0]
        } else {
            return nil
        }
    }
}

class Node<T> {
    var value: T
    var left: Node?
    var right: Node?
    
    init(value: T) {
        self.value = value
    }
}

func createBinaryTree() -> Node<Int> {
    let root = Node<Int>(value: 1)
    root.left = Node<Int>(value: 2)
    root.right = Node<Int>(value: 3)
    root.left!.left = Node<Int>(value: 4)
    root.left!.right = Node<Int>(value: 5)
    root.right!.left = Node<Int>(value: 6)
    root.right!.right = Node<Int>(value: 7)
    return root
}

func printLevelOrder(root : Node<Int>) {
    
    var queue = Queue<Node<Int>>()
    queue.enqueue(root)
    
    while (!queue.list.isEmpty) {
        let tempNode = queue.dequeue()!
        print(tempNode.value)
        
        if (tempNode.left != nil) {
            queue.enqueue(tempNode.left!)
        }
        
        if (tempNode.right != nil) {
            queue.enqueue(tempNode.right!)
        }
    }
}

printLevelOrder(root: createBinaryTree())
