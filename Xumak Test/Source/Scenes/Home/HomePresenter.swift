//
//  HomePresenter.swift
//  Xumak Test
//
//  Created by Erick Pac on 27/01/21.
//

import UIKit

class HomePresenterImpl: Presenter, HomePresenter {
    
    var router: HomeRouter!
    weak var view: HomeView!
    private let apiManger: APIManager
    
    init(apiManager: APIManager = Injections.shared.apiManager) {
        self.apiManger = apiManager
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.prepare(for: segue, sender: sender)
    }
    
}

// MARK: - HomePresenter

extension HomePresenterImpl {
    
    func start() {
        fetchBooks()
    }
    
    func fetchBooks() {
        apiManger.performRequest(to: "books.json") { [weak self] (response: [Book]?) in
            let books = response ?? []
            self?.view.fetchedBooks(books: books)
        } failure: { (error) in
            print("Error: \(error?.localizedDescription ?? "")")
        }
    }
    
}
