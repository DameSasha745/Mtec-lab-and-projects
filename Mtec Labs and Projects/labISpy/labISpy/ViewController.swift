//
//  ViewController.swift
//  labISpy
//
//  Created by Sasha Cummings on 3/4/25.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet var myScrollView: UIScrollView!
    
    @IBOutlet var myImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myScrollView.delegate = self
        myScrollView.contentSize = myImage.bounds.size
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return myImage
    }
    func updateForZooming(size: CGSize) {
        let widthScale = size.width / myImage.bounds.height
        let heightScale = size.height / myImage.bounds.height
        let scale = max(widthScale, heightScale)
        myScrollView.minimumZoomScale = scale
        myScrollView.zoomScale = scale
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        updateForZooming(size: view.bounds.size)
    }
}
    
    
