//
//  BaseViewController.swift
//  Telecable
//
//  Created by Erick Pac on 23/11/20.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeSubviews()
    }
    
    // Subclases needs override
    func initializeSubviews() {}
    
}
