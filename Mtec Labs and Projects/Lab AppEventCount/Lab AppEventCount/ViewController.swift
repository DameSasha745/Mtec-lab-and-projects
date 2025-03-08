//
//  ViewController.swift
//  Lab AppEventCount
//
//  Created by Sasha Cummings on 2/27/25.
//

import UIKit

class ViewController: UIViewController {
    
    var appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    
    @IBOutlet var appDidFinishLaunchingLabel: UILabel!
    
    @IBOutlet var appDidConfigureConnectionsLabel: UILabel!
    
    @IBOutlet var sceneWillConnectToLabel: UILabel!
    var willConnectCount = 0
    
    @IBOutlet var sceneDidBecomeActiveLabel: UILabel!
    var didActiveCount = 0
    
    @IBOutlet var sceneWillResignActiveLabel: UILabel!
    var willActiveCount = 0
    
    @IBOutlet var sceneWillEnterForegroundLabel: UILabel!
    var willEnterCount = 0
    
    @IBOutlet var sceneDidEnterBackgroundLabel: UILabel!
    var didEnterCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    func updateView() {
        appDidFinishLaunchingLabel.text = "The app has launched \(appDelegate.launchCount) time(s)."
        appDidConfigureConnectionsLabel.text = "The app did configure \(appDelegate.configurationForConnetingCount) time(s)."
        
        sceneWillConnectToLabel.text = "The app will connect \(willConnectCount) time(s)."
        
        sceneDidBecomeActiveLabel.text = "The app did become active \(didActiveCount) time(s)."
        
        sceneWillResignActiveLabel.text = "The app will become active \(willActiveCount) time(s)."
        
        sceneWillEnterForegroundLabel.text = "The app will enter foreground \(willEnterCount) time(s)."
        
        sceneDidEnterBackgroundLabel.text = "The app did enter background \(didEnterCount) time(s)."
        
    }
}

