//
//  QueueViewController.swift
//  DataStructures
//
//  Created by Ju on 2020/4/22.
//  Copyright © 2020 Ju. All rights reserved.
//

import UIKit

class QueueViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }
    
    private func queueArrayTest() {
        var queue = QueueArray<String>()
        queue.enqueue("C")
        queue.enqueue("Swift")
        queue.enqueue("Objective-C")
        
        print("Queue: \(queue)")
        
        queue.dequeue()
        print("After dequeue, Queue: \(queue)")
        
        queue.peek
        print("After peek, Queue: \(queue)")
    }
    
    private func queueLinkedListTest() {
        var queue = QueueLinkedList<String>()
        queue.enqueue("C")
        queue.enqueue("Swift")
        queue.enqueue("Objective-C")
        
        print("Queue: \(queue)")
        
        queue.dequeue()
        print("After dequeue, Queue: \(queue)")
        
        queue.peek
        print("After peek, Queue: \(queue)")
    }
    
    private func queueRingBufferTest() {
        var queue = QueueRingBuffer<String>(count: 10)
        queue.enqueue("C")
        queue.enqueue("Swift")
        queue.enqueue("Objective-C")
        
        print("Queue: \(queue)")
        
        queue.dequeue()
        print("After dequeue, Queue: \(queue)")
        
        queue.peek
        print("After peek, Queue: \(queue)")
    }


    private func queueStackTest() {
        var queue = QueueStack<String>()
        queue.enqueue("C")
        queue.enqueue("Swift")
        queue.enqueue("Objective-C")
        
        print("Queue: \(queue)")
        
        queue.dequeue()
        print("After dequeue, Queue: \(queue)")
        
        queue.peek
        print("After peek, Queue: \(queue)")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        queueStackTest()
    }
    
}






public protocol Queue {
    
    associatedtype QueueElement
    
    mutating func enqueue(_ element: QueueElement) -> Bool
    
    mutating func dequeue() -> QueueElement?
    
    var isEmpty: Bool { get }
    
    var peek: QueueElement? { get }
    
}

// MARK: - QueueArray

public struct QueueArray<T>: Queue {
    
    // 使用数组存储实现队列数据结构
    private var array: [T] = []
    
    public init() {}
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var peek: T? {
        return array.first
    }
    
    public mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
    
    public mutating func dequeue() -> T? {
        isEmpty ? nil : array.removeFirst()
    }
    
}

extension QueueArray: CustomStringConvertible {
    
    public var description: String {
        String(describing: array)
    }
    
}

// MRK: - QueueLinkedList

public class QueueLinkedList<T>: Queue {
    
    private var list = DoublyLinkedList<T>()
    public init() {}
    
    public var peek: T? {
        list.first?.value
    }
    
    public var isEmpty: Bool {
        list.isEmpty
    }
    
    public func enqueue(_ element: T) -> Bool {
        list.append(element)
        return true
    }
    
    public func dequeue() -> T? {
        guard !list.isEmpty, let element = list.first else {
            return nil
        }
        return list.remove(element)
    }
}

extension QueueLinkedList: CustomStringConvertible {
    
    public var description: String {
        String(describing: list)
    }
}


// MARK: - QueueRingBuffer

public struct QueueRingBuffer<T>: Queue {
    
    private var ringBuffer: RingBuffer<T>
    
    init(count: Int) {
        ringBuffer = RingBuffer<T>(count: count)
    }
    
    public var isEmpty: Bool {
        return ringBuffer.isEmpty
    }
    
    public var peek: T? {
        return ringBuffer.first
    }
    
    public mutating func enqueue(_ element: T) -> Bool {
        ringBuffer.write(element)
    }
    
    public mutating func dequeue() -> T? {
        ringBuffer.read()
    }
    
}

extension QueueRingBuffer: CustomStringConvertible {
    
    public var description: String {
        String(describing: ringBuffer)
    }
    
}


// MARK: - QueueStack

public struct QueueStack<T>: Queue {
    
    private var leftStack: [T] = []
    private var rightStack: [T] = []
    
    public init() { }
    
    public var isEmpty: Bool {
        return leftStack.isEmpty && rightStack.isEmpty
    }
    
    public var peek: T? {
        !leftStack.isEmpty ? leftStack.last : rightStack.first
    }

    
    public mutating func enqueue(_ element: T) -> Bool {
        rightStack.append(element)
        return true
    }
    
    public mutating func dequeue() -> T? {
        // 如果出队数组为空，则引用入队数组里面的倒序数组数据
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
        
        return leftStack.popLast()
    }
    
}

extension QueueStack: CustomStringConvertible {
    
    public var description: String {
        String(describing: leftStack.reversed() + rightStack)
    }
    
}
