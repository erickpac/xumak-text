//
//  Router.swift
//  Telecable
//
//  Created by Erick Pac on 23/11/20.
//

import UIKit

protocol Router: class {
    typealias ViewController = UIViewController
    var viewController: ViewController! { get }
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
}
