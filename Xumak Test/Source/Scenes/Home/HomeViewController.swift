//
//  HomeViewController.swift
//  Xumak Test
//
//  Created by Erick Pac on 27/01/21.
//

import UIKit

class HomeViewController: BaseViewController, StoryboardLoadable, HomeView {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: HomePresenter!
    static var storyboardId = "HomeViewController"
    static var storyboardName = "Main"
    private var books: [Book] = [Book]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        presenter.prepare(for: segue, sender: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.start()
    }
    
    private func prepareTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HomeBookItemCell.nib, forCellReuseIdentifier: HomeBookItemCell.reuseIdentifier)
    }
    
}

extension HomeViewController: UITableViewDelegate {
    
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let book = books[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeBookItemCell.reuseIdentifier, for: indexPath) as? HomeBookItemCell ?? HomeBookItemCell()
        cell.configure(book: book)
        return cell
    }
    
}

extension HomeViewController {
    
    func fetchedBooks(books: [Book]) {
        self.books = books
    }
    
}
