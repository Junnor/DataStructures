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
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    private var type: Type = .stack
    
    @IBAction func next() {
        switch type {
        case .stack:
            let vc = StackViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }


}

