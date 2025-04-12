//
//  CreatPostVC.swift
//  project Tech social media app
//
//  Created by Sasha Cummings on 3/24/25.
//

import UIKit

class CreatePostVC: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var imageView: UIImageView!
    
    var post: Post?
    var postToEdit: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let post = postToEdit {
            print("Editing: \(post.text)")
            imageView.image = post.image
            textView.text = post.text
        } else {
            print("PostToEdit is nil")
            imageView.image = nil
            textView.text = ""
        }
    }
        @IBAction func postButtonTapped(_ sender: UIButton) {
            guard let image = imageView.image else { return }
            let text = textView.text ?? ""
            let newPost = Post(image: image, text: text)
            
            
            if let editingPost = postToEdit, let index = PostManager.shared.posts.firstIndex(where: { $0.id == editingPost.id }) {
                PostManager.shared.updatePost(at: index, with: newPost)
            } else {
                PostManager.shared.addPost(newPost)
            }
            NotificationCenter.default.post(name: .reloadPosts, object: nil)
            dismiss(animated: true, completion: nil)
        }
        @IBAction func selectImageTapped(_ sender: UIButton) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .photoLibrary
                present(imagePicker, animated: true)
            }
        }
        extension CreatePostVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
            func imagePickerController( _ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
                if let selectedImage = info[.originalImage] as? UIImage {
                    imageView.image = selectedImage
                }
                picker.dismiss(animated: true)
            }
        }

