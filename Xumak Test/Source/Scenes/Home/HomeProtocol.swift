//
//  HomeProtocol.swift
//  Xumak Test
//
//  Created by Erick Pac on 27/01/21.
//

import UIKit

protocol HomePresenter: Presenter {
    var view: HomeView! { get set }
    var router: HomeRouter! { get set }
    func start()
}

protocol HomeView: UIViewController {
    func fetchedBooks(books: [Book])
}

protocol HomeRouter: Router {
    
}
