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

func height(_ root : Node<Int>?) -> Int {
    if (root == nil) {
        return 0
    }
    let lh = height(root?.left)
    let rh = height(root?.right)
    
    return (lh > rh) ? lh + 1 : rh + 1
}

func printLevelOrder(_ root : Node<Int>?) {
    for i in 1...height(root) {
        printGivenLevel(root, i)
    }
}


func printGivenLevel(_ root : Node<Int>?, _ level : Int) {
    
    if (root == nil) {
        return
    }
    if (level == 1){
        print(root?.value)
    }
    else if (level > 1) {
        printGivenLevel(root?.left, level - 1)
        printGivenLevel(root?.right, level - 1)
    }
}

printLevelOrder(createBinaryTree())
