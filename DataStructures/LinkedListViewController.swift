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

    private func linkedListCollectionTest() {
        example(of: "using collection") {
            var list = LinkedList<Int>()
            
            for i in 0...9 {
                list.append(i)
            }
            
            print("List: \(list)")
            print("First Element: \(list[list.startIndex])")

            print("Array containing first 3 elements: \(Array(list.prefix(3)))")
            print("Array containing last 3 elements: \(Array(list.suffix(3)))")
            
            let sum = list.reduce(0, +)
            print("Sum of all values: \(sum)")
        }
    }

    private func linkedListArrayCOWTest() {
        example(of: "array cow") {
            let array1 = [1, 2]
            var array2 = array1
            
            print("array1: \(array1)")
            print("array2: \(array2)")
            
            print("After add 3 to array2")
            array2.append(3)
            print("array1: \(array1)")
            print("array2: \(array2)")
        }
    }
    
    private func linkedListLinkedListCOWTest() {
        example(of: "linked list cow") {
            var list1 = LinkedList<Int>()
            list1.append(1)
            list1.append(2)
            
            var list2 = list1
            
            print("list1: \(list1)")
            print("list2: \(list2)")
            
            print("After add 3 to list2")
            list2.append(3)
            print("list1: \(list1)")
            print("list2: \(list2)")
            
            print("Removing node at middle ")
            if let node = list2.node(at: 0) {
                print("Can remove....")
                list2.remove(after: node)
            }
            print("List2: \(list2)")
        }
    }
    
    private func linkedListShareNodesTest() {
        example(of: "linked list node share") {
            var list1 = LinkedList<Int>()
            (1...3).forEach { list1.append($0) }
            var list2 = list1

            list2.push(0)
            print("list1: \(list1)")
            print("list2: \(list2)")
            
            list1.push(100)
            print("list1: \(list1)")
            print("list2: \(list2)")
        }
    }
    
    private func chalenge1() {
        example(of: "linked list chalenge 1") {
            var list = LinkedList<Int>()
            (1...3).forEach { list.append($0) }
            print("list: \(list)")
            printInReverse(list)
        }
    }

    private func chalenge2() {
        example(of: "linked list chalenge 2") {
            var list = LinkedList<Int>()
            (1...4).forEach { list.append($0) }
            print("Original list: \(list)")
            if let middleNode = getMiddle(list) {
                print("Middle list: \(middleNode)")
            }
        }
    }

    
    private func chalenge3() {
        example(of: "linked list chalenge 3") {
            var list = LinkedList<Int>()
            (1...3).forEach { list.append($0) }
            print("Original list: \(list)")
            list.reverse()
            print("After reverse list: \(list)")
        }
    }

    private func chalenge4() {
        example(of: "linked list chalenge 4") {
            var list1 = LinkedList<Int>()
            list1.append(-1)
            list1.append(2)
            list1.append(3)
            list1.append(6)
            
            var list2 = LinkedList<Int>()
            list2.append(1)
            list2.append(4)
            list2.append(10)
            list2.append(11)
            
            print("List1: \(list1)")
            print("List2: \(list2)")
            
            let merge = mergeList(list1, with: list2)
            print("MergeList: \(merge)")
        }
    }

    private func chalenge5() {
        example(of: "linked list chalenge 5") {
            var list = LinkedList<Int>()
            list.append(1)
            list.append(3)
            list.append(3)
            list.append(4)
            
            print("Before removing list: \(list)")
            list.removeAll(3)
            print("After removing list: \(list)")
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        chalenge5()
    }

}



extension LinkedListViewController {
    
    // Chalenge 1
    private func printInReverse<T>(_ list: LinkedList<T>) {
        printInReverse(list.head)
    }
    
    private func printInReverse<T>(_ node: Node<T>?) {
        guard let node = node else {
            return
        }
        printInReverse(node.next)
        print(node.value)
    }
    
    // Chalenge 2
    private func getMiddle<T>(_ list: LinkedList<T>) -> Node<T>? {
        var slow = list.head
        var fast = list.head
        while let nextFast = fast?.next {
            fast = nextFast.next
            slow = slow?.next
        }
        return slow
    }
    
    // Chalenge 4
    private func mergeList<T: Comparable>(_ left: LinkedList<T>, with right: LinkedList<T>) -> LinkedList<T> {
        
        // 判断是否有空链表
        if left.isEmpty {
            return right
        }
        
        if right.isEmpty {
            return left
        }
        
        var newHead: Node<T>?
        
        // 找到起始节点
        var tail: Node<T>?
        var currentLeft = left.head
        var currentRight = right.head
        
        if let leftNode = currentLeft, let rightNode = currentRight {
            if leftNode.value < rightNode.value {
                newHead = leftNode // 设置新头部
                currentLeft = leftNode.next
            } else {
                newHead = rightNode // 设置新头部
                currentRight = rightNode.next
            }
            tail = newHead
        }
        
        // 遍历一遍，此时会有一个链表便利完
        while let leftNode = currentLeft, let rightNode = currentRight {
            if leftNode.value < rightNode.value {
                tail?.next = leftNode
                currentLeft = leftNode.next
            } else {
                tail?.next = rightNode
                currentRight = rightNode.next
            }
            tail = tail?.next
        }
        
        // 把某个剩余的链表遍历完
        if let leftNodes = currentLeft {
            tail?.next = leftNodes
        }
        
        if let rightNodes = currentRight {
            tail?.next = rightNodes
        }

        // 创建一个新的链表
        var newList = LinkedList<T>()
        newList.head = newHead
        newList.tail = {
            while let next = tail?.next {
                tail = next
            }
            return tail
        }()

        return newList
    }
    
    // Chalenge 5
    private func removeOccurence<T: Comparable>(_ value: T, in list: LinkedList<T>) -> LinkedList<T> {
        // 如果需要移除头部相等元素
        var head = list.head
        while let newHead = head, newHead.value == value {
            head = newHead.next
        }
        
    
        var newList = list

        var current = newList.head
        var prev = newList.head
        
        while current != nil {
            if current!.value == value {
                if current === newList.head {
                    current = current?.next
                    prev = current?.next
                    newList.head = current // reset head
                } else {
                    current = current?.next
                    prev?.next = current
                    
                    if current == nil {
                        newList.tail = prev // reset tail
                    }
                }
            } else {
                prev = current
                current = current?.next
            }
        }
        return newList
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

public struct LinkedList<Value> {
    
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public init() {}
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public mutating func push(_ value: Value) {
        copyNodes()

        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    public mutating func append(_ value: Value) {
        copyNodes()

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
        copyNodes()

        guard tail !== node else {
            append(value)
            return tail!
        }
        node.next = Node(value: value, next: node.next)
        return node.next!
    }
    
    @discardableResult
    public mutating func pop() -> Value? {
        copyNodes()

        head = head?.next
        if isEmpty {
            tail = nil
        }
        return head?.value
    }
    
    @discardableResult
    public mutating func removeLast() -> Value? {
        copyNodes()

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
        guard let node = copyNodes(returningCopyOf: node) else {
            return nil
        }
        
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }
    
    // 从头到尾复制一份
    @discardableResult
    private mutating func copyNodes() -> Bool {
        guard !isKnownUniquelyReferenced(&head) else {
            return false
        }
        
        guard var oldNode = head else {
            return false
        }
        
        head = Node(value: oldNode.value)
        var newNode = head
        
        while let nextOldNode = oldNode.next {
            newNode?.next = Node(value: nextOldNode.value)
            newNode = newNode?.next
            
            oldNode = nextOldNode
        }
        
        tail = newNode
        return true
    }
    
    private mutating func copyNodes(returningCopyOf node: Node<Value>?) -> Node<Value>? {
        guard !isKnownUniquelyReferenced(&head) else {
            return nil
        }
        
        guard var oldNode = head else {
            return nil
        }
        
        head = Node(value: oldNode.value)
        var newNode = head
        var copyNode: Node<Value>?
        
        while let nextOldNode = oldNode.next {
            if oldNode === node {
                copyNode = newNode
            }
            newNode?.next = Node(value: nextOldNode.value)
            newNode = newNode?.next
            
            oldNode = nextOldNode
        }
                
        return copyNode
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


extension LinkedList: Collection {
    
    // 自定义下标
    public struct Index: Comparable {
        public var node: Node<Value>?
        
        static public func ==(lhs: Self, rhs: Self) -> Bool {
            switch (lhs.node, rhs.node) {
            case let (left?, right?):
                return left === right
            case (nil, nil):
                return true
            default:
                return false
            }
        }
        
        static public func < (lhs: Self, rhs: Self) -> Bool {
            guard lhs != rhs else {
                return false
            }
            let nodes = sequence(first: lhs.node) { $0?.next }
            return nodes.contains { $0 === rhs.node }
        }
    }
    
    // 下面的是 Collection 结合协议最少实现内容
    
    public var startIndex: Index {
        return Index(node: head)
    }
    
    public var endIndex: Index {
        return Index(node: tail?.next)
    }
    
    public func index(after i: Index) -> Index {
        return Index(node: i.node?.next)
    }
    
    public subscript(position: Index) -> Value {
        return position.node!.value
    }
        
}


extension LinkedList {
    
    // Chalenge 3
    mutating func reverse() {
        tail = head
        
        var prev = head
        var current = head?.next
        prev?.next = nil
        
        while current != nil {
            let next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
        
        head = prev
    }

}

extension LinkedList where Value: Equatable {
    
    // Chalenge 5
    mutating func removeAll(_ value: Value) {
        // 如果必要移除头部
        while let head = self.head, head.value == value {
            self.head = head.next
        }
        
        // 遍历移除
        var prev = head
        var current = head?.next
        while let currentNode = current {
            guard currentNode.value != value else {
                prev?.next = currentNode.next
                current = prev?.next
                continue
            }
            prev = current
            current = current?.next
        }
        
        // 设置尾部
        tail = prev
    }
    
}
