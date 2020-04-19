//
//  LinkedListViewController.swift
//  DataStructures
//
//  Created by Ju on 2020/4/19.
//  Copyright © 2020 Ju. All rights reserved.
//

import UIKit

class LinkedListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        linkedListRemoveAfterTest()
    }
    
    private func nodeTest() {
        example(of: "creating and linking nodes") {
            let node1 = Node(value: 1)
            let node2 = Node(value: 2)
            let node3 = Node(value: 3)
            
            node1.next = node2
            node2.next = node3
            
            print(node1)
        }
    }
    
    private func linkedListPushTest() {
        example(of: "push") {
            var list = LinkedList<Int>()
            
            list.push(3)
            list.push(2)
            list.push(1)
            
            print(list)
        }
    }
    
    private func linkedListAppendTest() {
        example(of: "append") {
            var list = LinkedList<Int>()
            
            list.append(1)
            list.append(2)
            list.append(3)

            print(list)
        }
    }

    
    private func linkedListInsertTest() {
        example(of: "inserting at a particular index") {
            var list = LinkedList<Int>()
            
            list.append(1)
            list.append(2)
            list.append(3)
            
            print("Before inserting: \(list)")

            let middleIndex = list.node(at: 1)!
            for _ in 1...4 {
                list.insert(-1, after: middleIndex)
            }
            
            print("After inserting: \(list)")

        }
    }

    private func linkedListPopTest() {
        example(of: "pop") {
            var list = LinkedList<Int>()
            
            list.append(1)
            list.append(2)
            list.append(3)
            
            print("Before popping: \(list)")
            let popedValue = list.pop()
            print("After popping: \(list)")
            
            print("PopedValue = \(String(describing: popedValue))")
        }
    }

    private func linkedListRemoveLastTest() {
        example(of: "removing the last node") {
            var list = LinkedList<Int>()
            
            list.append(1)
            list.append(2)
            list.append(3)
            
            print("Before removing last node: \(list)")
            let removedValue = list.removeLast()
            print("After removing last node: \(list)")

            print("RemovedValue = \(String(describing: removedValue))")
        }
    }
    

    private func linkedListRemoveAfterTest() {
        example(of: "removing a node after a particular node") {
            var list = LinkedList<Int>()
            
            list.append(1)
            list.append(2)
            list.append(3)
            
            print("Before removing at particular node: \(list)")
            let index = 1
            let node = list.node(at: 1-index)!
            let removedValue = list.remove(after: node)
            print("After removing at particular node: \(list)")

            print("RemovedValue = \(String(describing: removedValue))")
        }
    }

    
}




public struct LinkedList<Value> {
    
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public init() {}
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    public mutating func append(_ value: Value) {
        guard !isEmpty else {
            push(value)
            return
        }
        tail?.next = Node(value: value)
        tail = tail?.next
    }
    
    
    public func node(at index: Int) -> Node<Value>? {
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
    @discardableResult
    public mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
        guard tail !== node else {
            append(value)
            return tail!
        }
        node.next = Node(value: value, next: node.next)
        return node.next!
    }
    
    @discardableResult
    public mutating func pop() -> Value? {
        head = head?.next
        if isEmpty {
            tail = nil
        }
        return head?.value
    }
    
    @discardableResult
    public mutating func removeLast() -> Value? {
        
        // count >= 1
        guard let head = head else {
            return nil
        }
        
        // count >= 2
        guard head.next != nil else {
            return pop()
        }
        
        var prev = head
        var current = head
        
        while let next = current.next {
            prev = current
            current = next
        }
        
        prev.next = nil
        tail = prev
        
        return current.value
    }
    
    @discardableResult
    public mutating func remove(after node: Node<Value>) -> Value? {
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }
    
}

extension LinkedList: CustomStringConvertible {
    
    public var description: String {
    
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
    
}



public class Node<Value> {
    
    var value: Value
    var next: Node?
    
    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
    
}

extension Node: CustomStringConvertible {
    
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + "\(String(describing: next))" + " "
    }
    
}
