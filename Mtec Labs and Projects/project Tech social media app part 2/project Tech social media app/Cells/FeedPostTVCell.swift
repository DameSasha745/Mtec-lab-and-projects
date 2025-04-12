//
//  FeedPostTVCell.swift
//  project Tech social media app
//
//  Created by Sasha Cummings on 4/10/25.
//

import UIKit

class FeedPostTVCell: UITableViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var postTextViewLabel: UILabel!
    
    func configure(with post: Post) {
        postImageView.image = post.image
        postTextViewLabel.text = post.text
    }
}
