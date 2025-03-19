//
//  BookTableViewCell.swift
//  FavoriteBooks
//
//  Created by Sasha Cummings on 3/10/25.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var authorLabel: UILabel!
    
    @IBOutlet var genreLabel: UILabel!
    
    @IBOutlet var lengthLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func update(with book: Book) {
        titleLabel.text = book.title
        authorLabel.text = book.author
        genreLabel.text = book.genre
        lengthLabel.text = book.length
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
