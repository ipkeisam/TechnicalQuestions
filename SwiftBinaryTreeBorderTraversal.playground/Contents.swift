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

func printLeaves(_ root : Node<Int>?) {
    if (root != nil) {
        printLeaves(root?.left)
        
        if (root?.left == nil && root?.right == nil) {
            print(root!.value)
        }
        
        printLeaves(root?.right)
    }
}

func printBoundaryLeft(_ root : Node<Int>?) {
    if (root != nil) {
        if (root?.left != nil) {
            print(root!.value)
            printBoundaryLeft(root?.left)
        }
        else if (root?.right != nil){
            print(root!.value)
            printBoundaryLeft(root?.right)
        }
    }
}

func printBoundaryRight(_ root: Node<Int>?) {
    if (root != nil) {
        if (root?.right != nil) {
            printBoundaryRight(root?.right)
            print(root!.value)
        }
        else if (root?.left != nil) {
            printBoundaryRight(root?.left)
            print(root!.value)
        }
    }
}

func printBorderOrder(root : Node<Int>?) {
    if (root != nil) {
        print(root!.value)
        printBoundaryLeft(root?.left)
        printLeaves(root)
        printBoundaryRight(root?.right)
    }
}

printBorderOrder(root: createBinaryTree())
