public class BidirectionalNode<T> {
    
    public var value: T
    public var next: BidirectionalNode<T>?
    public var previous: BidirectionalNode<T>?
    
    public init(value: T) {
        self.value = value
    }
}

extension BidirectionalNode: CustomStringConvertible {
    
    public var description: String {
        String(describing: value)
    }
}

public class DoublyLinkedList<T> {
    
    private var head: BidirectionalNode<T>?
    private var tail: BidirectionalNode<T>?
    
    public init() { }
    
    public var isEmpty: Bool {
        head == nil
    }
    
    public var first: BidirectionalNode<T>? {
        head
    }
    
    public func append(_ value: T) {
        let newNode = BidirectionalNode(value: value)
        
        guard let tailNode = tail else {
            head = newNode
            tail = newNode
            return
        }
        
        newNode.previous = tailNode
        tailNode.next = newNode
        tail = newNode
    }
    
    public func remove(_ node: BidirectionalNode<T>) -> T {
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        
        next?.previous = prev
        
        if next == nil {
            tail = prev
        }
        
        node.previous = nil
        node.next = nil
        
        return node.value
    }
}

extension DoublyLinkedList: CustomStringConvertible {
    
    public var description: String {
        var string = ""
        var current = head
        while let node = current {
            string.append("\(node.value) -> ")
            current = node.next
        }
        return string + "end"
    }
}

public class LinkedListIterator<T>: IteratorProtocol {
    
    private var current: BidirectionalNode<T>?
    
    init(node: BidirectionalNode<T>?) {
        current = node
    }
    
    public func next() -> BidirectionalNode<T>? {
        defer { current = current?.next }
        return current
    }
}

extension DoublyLinkedList: Sequence {
    
    public func makeIterator() -> LinkedListIterator<T> {
        LinkedListIterator(node: head)
    }
}
