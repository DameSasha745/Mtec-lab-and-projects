//
//  PostManagar.swift
//  project Tech social media app
//
//  Created by Sasha Cummings on 4/10/25.
//

import Foundation
import UIKit

 class PostManager {
     static let shared = PostManager()
    private let storageKey = "SavedPosts"
    
    var posts: [Post] = [
        Post(image: UIImage(named: "Wolf_God") ?? UIImage(), text: "Wolf God")
    ]
    
    init() {
     loadPosts()
    }
    func addPost(_ post: Post) {
        posts.insert(post, at: 0)
        savePosts()
    }
    func updatePost(at index: Int, with post: Post) {
        guard posts.indices.contains(index) else { return }
        posts[index] = post
        savePosts()
    }
    private func savePosts() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(posts) {
            UserDefaults.standard.set(encoded, forKey: storageKey)
        }
    }
    private func loadPosts() {
        let decoder = JSONDecoder()
        if let data = UserDefaults.standard.data(forKey: storageKey), let savedPosts = try? decoder.decode([Post].self, from: data) {
            posts = savedPosts
        }
    }
}

