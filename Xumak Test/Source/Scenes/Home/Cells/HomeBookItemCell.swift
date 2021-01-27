//
//  HomeBookItemCell.swift
//  Xumak Test
//
//  Created by Erick Pac on 27/01/21.
//

import UIKit

class HomeBookItemCell: UITableViewCell {
    
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var bookImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        prepareUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func prepareUI() {
        
    }
    
    func configure(book: Book) {
        bookTitleLabel.text = book.title
        bookImageView.loadImage(path: book.image)
    }
    
}

extension HomeBookItemCell: NibLoadable {
    static let reuseIdentifier: String = "HomeBookItemCell"
}
