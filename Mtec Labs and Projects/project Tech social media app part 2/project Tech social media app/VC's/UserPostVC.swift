//
//  UserPostVC.swift
//  project Tech social media app
//
//  Created by Sasha Cummings on 3/24/25.
//

import UIKit

class UserPostVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTable), name: .reloadPosts, object: nil)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 150
    }
    @objc func reloadTable() {
        tableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PostManager.shared.posts.isEmpty ? 0 : 1
        }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = PostManager.shared.posts.first!
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfilePostCell", for: indexPath) as! PostTVCell
        cell.configure(with: post)
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CreatePost", let destination = segue.destination as? CreatePostVC {
            destination.postToEdit = nil
        }
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

