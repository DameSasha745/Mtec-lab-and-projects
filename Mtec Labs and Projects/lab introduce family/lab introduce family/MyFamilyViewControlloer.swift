//
//  MyFamilyViewControlloer.swift
//  lab introduce family
//
//  Created by Sasha Cummings on 2/18/25.
//

import UIKit

class MyFamilyViewControlloer: UIViewController {
    
    @IBOutlet var sashaButton: UIButton!
    
    @IBOutlet var jaydnenButton: UIButton!
    
    @IBOutlet var adrianButton: UIButton!
    
    @IBOutlet var cloveButton: UIButton!
    
    @IBOutlet var rooButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    
    @IBAction func sashaButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "detail1", sender: sender)
    }
    
    @IBAction func jaydenButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "detail1", sender: sender)
    }
    @IBAction func adrianButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "detail1", sender: sender)
    }
    @IBAction func cloveButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "detail1", sender: sender)
    }
    @IBAction func rooButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "detail1", sender: sender)

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? DetilViewContorller,
        let button = sender as? UIButton else {
            return
        }
        
        switch button {
        case sashaButton:
            vc.person = Person(name: "Sasha Cummings", detail: "IT'S ME!  I am 32  Like my dad i am self employed, only instead of selling music i seel 3D printed toys and more. I love dressing up and going to theamed events. I also love to writing     storys and drowing anything fantisy.", imageName: "me4")
            
        case jaydnenButton:
            vc.person = Person(name: "Jayden Cummings", detail: "Jayden is my wonderfull and kind husband. he likes nurdy things like    D & D. he also loves to play video games. he is a home body and really enjoys eating cookies.", imageName: "jayden4")
            
        case adrianButton:
            vc.person = Person(name: "Adrian Cummings", detail: "Adrian is our little boy. he is full of energy and more often then not very happy. though he is say much he is verry chatty and lets you know what he wants when he wants. he loves Mcqueen from cars and bam from batweels(batman animation)", imageName: "adrian5")
            
        case cloveButton:
            vc.person = Person(name: "Clove", detail: "Clove is a sister to Roo. she is varry chatty and she vibrates when she purrs. she is verry sassy in her own way and if she finds momma alone she is always quick to say hay...l want to be on your lap! sometimes we have talks too.", imageName: "clove1")
            
        case rooButton:
            vc.person = Person(name: "Roo", detail: "Roo is not like her sister, and sometimes a little lazy when climing a bannister or anything. she would rather slide down her purch  then get up and then get down.  she dosnt talk alot and when she dose its a merp.", imageName: "roo4")
            
        default:
            vc.person = Person(name: "Error", detail: "Empty", imageName: " ")
        }
    }
}
            


