//
//  Post.swift
//  project Tech social media app
//
//  Created by Sasha Cummings on 3/24/25.
//

import Foundation
import UIKit


struct Post: Codable {
    let id: UUID
    var imageFileName: String
    var text: String
    
    var image: UIImage {
        let url = Post.documentDirectory.appendingPathComponent(imageFileName)
        return UIImage(contentsOfFile: url.path) ?? UIImage()
    }
    static var documentDirectory: URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    init(image: UIImage, text: String) {
        self.id = UUID()
        self.imageFileName = UUID().uuidString + ".jpg"
        self.text = text
        saveImage(image)
    }
    private func saveImage(_ image: UIImage) {
        let url = Post.documentDirectory.appendingPathComponent(imageFileName)
        if let data = image.jpegData(compressionQuality: 0.8) {
            try? data.write(to: url)
        }
    }
}
extension Notification.Name {
    static let reloadPosts = Notification.Name("reloadPosts")
}
//firstIndex(where: { $0.uuid == post.uuid })
