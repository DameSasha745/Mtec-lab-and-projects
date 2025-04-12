//
//  PostTVCell.swift
//  project Tech social media app
//
//  Created by Sasha Cummings on 4/10/25.
//

import UIKit

class PostTVCell: UITableViewCell {
    
    @IBOutlet weak var postImageView: UIImageView!
    
    func configure(with post: Post) {
        postImageView.image = post.image
    }
}
