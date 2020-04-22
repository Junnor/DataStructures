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

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        queueLinkedListTest()
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

