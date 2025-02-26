//
//  DetilViewContorller.swift
//  lab introduce family
//
//  Created by Sasha Cummings on 2/18/25.
//

import UIKit
    class DetilViewContorller: UIViewController {
        
        
        @IBOutlet var label: UILabel!
        
        @IBOutlet var image: UIImageView!
        
        @IBOutlet var mytext: UITextView!
        
        
        var person: Person!
        override func viewWillAppear(_ animated: Bool) {
            label.text = person.name
            image.image = UIImage(named: person.imageName)
            mytext.text = person.detail
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
        }
        
}

class Person {
    let name: String
    let detail: String
    let imageName: String
    
    init(name: String, detail: String, imageName: String) {
        self.name = name
        self.detail = detail
        self.imageName = imageName
    }
}
