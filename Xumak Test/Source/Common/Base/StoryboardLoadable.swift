//
//  StoryboardLoadable.swift
//  Telecable
//
//  Created by Erick Pac on 23/11/20.
//

import UIKit

protocol StoryboardLoadable: class {
    static var storyboardId: String { get }
    static var storyboardName: String { get }
}

extension StoryboardLoadable {
    static func loadFromStoryboard() -> Self {
        // swiftlint:disable force_cast
        return UIStoryboard(name: storyboardName, bundle: Bundle.main).instantiateViewController(withIdentifier: storyboardId) as! Self
        // swiftlint:enable force_cast
    }
}
