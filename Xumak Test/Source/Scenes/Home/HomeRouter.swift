//
//  HomeRouter.swift
//  Xumak Test
//
//  Created by Erick Pac on 27/01/21.
//

import UIKit

class HomeRouterImpl: Router, HomeRouter {
    
    weak var viewController: Router.ViewController!
    
    init(viewController: Router.ViewController) {
        self.viewController = viewController
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
}
