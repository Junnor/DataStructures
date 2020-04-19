//
//  StackViewController.swift
//  Learning
//
//  Created by Ju on 2020/4/18.
//  Copyright © 2020 Ju. All rights reserved.
//

import UIKit

func example(of des: String, block:() -> ()) {
    print("---Example of \(des)---")
    block()
}


class StackViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        example(of: "using a stack") {
//            var stack = Stack<Int>()
//
//            stack.push(1)
//            stack.push(2)
//            stack.push(3)
//            stack.push(4)
//
//            print(stack)
//
//            if let popedElement = stack.pop() {
//                assert(popedElement == 4)
//                print("Popped: \(popedElement)")
//            }
//        }
        
//        example(of: "initializing a stack from an array") {
//            let stack = Stack([1, 2, 3, 4])
//            print(stack)
//        }
        
//        example(of: "initializing a stack from an array literal") {
//            let stack: Stack = [1.0, 2.0, 3.0, 4.0]
//            print(stack)
//        }
        
        
//        printInReverse([1, 2, 3])
        
        print("Is balance = \(checkParentheses("(((ee)))we"))")
    }
    
    
}

extension StackViewController {
    
    func printInReverse<T>(_ elements: [T]) {
        var stack = Stack<T>()
        for value in elements {
            stack.push(value)
        }
        print(stack)
    }
    
    func checkParentheses(_ string: String) -> Bool {
        var stack = Stack<String.Element>()
        for character in string {
            if character == "(" {
                stack.push("(")
            } else if character == ")" {
                if stack.isEmpty {
                    return false
                } else {
                    stack.pop()
                }
            }
        }
        return stack.isEmpty
    }
    
}

public struct Stack<Element> {
    
    private var storage: [Element] = []
    
    public init() { }
    
    public init(_ elements: [Element]) {
        storage = elements
    }
    
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        return storage.popLast()
    }
    
    public func peek() -> Element? {
        return storage.last
    }
    
    public var isEmpty: Bool {
        return peek() == nil
    }
    
}

extension Stack: CustomStringConvertible {
    
    public var description: String {
        """
        ------- top -------
        \(storage.map { "\($0)" }.reversed().joined(separator: "\n"))
        -------------------
        """
    }
    
}

extension Stack: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: Element...) {
        storage = elements
    }
    
}
