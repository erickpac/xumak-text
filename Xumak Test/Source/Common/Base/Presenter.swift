//
//  Presenter.swift
//  Telecable
//
//  Created by Erick Pac on 23/11/20.
//

import UIKit

protocol Presenter: class {
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
}
