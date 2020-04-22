//
//  ViewController.swift
//  DataStructures
//
//  Created by Ju on 2020/4/19.
//  Copyright © 2020 Ju. All rights reserved.
//

import UIKit

enum Type {
    case stack
    case linkedList
    case queue
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private var type: Type = .queue
    
    @IBAction func next() {
        switch type {
        case .stack:
            let vc = StackViewController()
            navigationController?.pushViewController(vc, animated: true)
        case .linkedList:
            let vc = LinkedListViewController()
            navigationController?.pushViewController(vc, animated: true)
        case .queue:
            let vc = QueueViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }


}

