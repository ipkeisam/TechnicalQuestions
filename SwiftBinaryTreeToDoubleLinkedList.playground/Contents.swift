//: Swift Binary Tree Level Order Traversal

import UIKit

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

var head : Node<Int>?
var prev : Node<Int>?

func binaryTreeToDoubleLinkedList(_ root : Node<Int>?) {
    
    if (root == nil) {
        return
    }
    
    binaryTreeToDoubleLinkedList(root?.left)
    
    if (prev == nil) {
        head = root
    }
    else {
        root?.left = prev
        prev?.right = root
    }
    prev = root
    
    binaryTreeToDoubleLinkedList(root?.right)
    
}

prev?.right = head
head?.left = prev

func printDoubleLinkedList(_ root : Node<Int>?) {
    
    var temp = root
    for i in 1...10 {
        print(temp?.value)
        temp = temp?.right
    }
}

binaryTreeToDoubleLinkedList(createBinaryTree())
printDoubleLinkedList(head)


