//
//  PostVC.swift
//  project Tech social media app
//
//  Created by Sasha Cummings on 2/24/25.
//

import UIKit

class PostVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var selectedPost: Post?
    
    @IBOutlet weak var feedTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedTableView.dataSource = self
        feedTableView.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        feedTableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PostManager.shared.posts.count
        }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = PostManager.shared.posts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! FeedPostTVCell
        cell.configure(with: post)
            return cell
        }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPost = PostManager.shared.posts[indexPath.row]
        performSegue(withIdentifier: "EditPost", sender: nil)
    }
    @IBSegueAction func showCreatedPost(_ coder: NSCoder) -> CreatePostVC? {
        guard let selectedIndexPath = feedTableView.indexPathForSelectedRow else { return nil }
        let post = PostManager.shared.posts[selectedIndexPath.row]
        
        let vc = CreatePostVC(coder: coder)
        vc?.postToEdit = post
        return vc
    }
}
