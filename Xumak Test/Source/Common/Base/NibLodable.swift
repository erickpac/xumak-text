//
//  NibLodable.swift
//  Telecable
//
//  Created by Erick Pac on 23/11/20.
//

import UIKit

protocol NibLoadable: class {
    static var reuseIdentifier: String { get }
    static var nib: UINib { get }
    static func loadFromNib() -> Self
}

extension NibLoadable {
    
    static var nib: UINib {
        UINib(nibName: reuseIdentifier, bundle: nil)
    }
    
    static func loadFromNib() -> Self {
        // swiftlint:disable force_cast
        nib.instantiate(withOwner: nil, options: nil).first as! Self // es fallable a posta, para corregir inmediatamente si falla
        // swiftlint:enable force_cast
    }
    
}
