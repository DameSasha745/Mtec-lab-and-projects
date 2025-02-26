//
//  MyImedeateFamViewController.swift
//  lab introduce family
//
//  Created by Sasha Cummings on 2/18/25.
//

import UIKit


class MyImedeateFamViewController: UIViewController {
    
    @IBOutlet var aaronButton: UIButton!
    
    @IBOutlet var deneseButton: UIButton!
    
    @IBOutlet var nicoleButton: UIButton!
    
    @IBOutlet var sashaButton: UIButton!
    
    @IBOutlet var peterButton: UIButton!
    
    @IBOutlet var rachelButton: UIButton!
    
    @IBOutlet var amyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func aaronButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "detail2", sender: sender)
    }
    @IBAction func deneseButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "detail2", sender: sender)
    }
    
    @IBAction func nicoleButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "detail2", sender: sender)
    }
    @IBAction func sashaButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "detail2", sender: sender)
    }
    @IBAction func peterButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "detail2", sender: sender)
    }
    @IBAction func rachelButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "detail2", sender: sender)
    }
    @IBAction func amyButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "detail2", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? DetilViewContorller,
        let button = sender as? UIButton else {
            return
        }
        
        switch button {
        case sashaButton:
            vc.person = Person(name: "Sasha Cummings", detail: "IT'S ME!  I am 32  Like my dad i am self employed, only instead of selling music i seel 3D printed toys and more. I love dressing up and going to theamed events. I also love to writing     storys and drowing anything fantisy.", imageName: "me4")
            
        case aaronButton:
            vc.person = Person(name: "Aaron Stokes", detail: " Aaron stokes is my Dad, he is the first child of  five. he is going to turn 53 or 54 I cant remember. ill fix this later! he is a musician and he gose to some renicance fairs ocationaly. he traviled on bike across half the U.S.....neat! ", imageName: "dad3")
            
        case deneseButton:
            vc.person = Person(name: "Denese Stokes", detail: "Denese Stokes is my Mom. she only has one other sibling, a sister! she is also the same age as my dad. she works at a place that makes the explosives to make air bags go off in cars", imageName: "mom1")
            
        case nicoleButton:
            vc.person = Person(name: "Nicole Gentry", detail: "Nicole is my oldest sister!  she is a year older then me. she is a proude momma of three dashing littel boys. she is marryed to her husband Jarry who is into lots of nurrdy things and guns!", imageName: "nicole fam")
            
        case peterButton:
            vc.person = Person(name: "Peter Stokes", detail: "Peter is my litle brother. fun little fact....when he was five, Nicole and  I dressed hime up like a princess by strapping a pillow and blenket to his butt. he is marred to his wonderfull wife Shaylee and has two beautiful kids zeke and zoe.", imageName: "peter fam")
            
        case rachelButton:
            vc.person = Person(name: "Rachel Stokes", detail: "Rachel is my little sister. she has worked at a animal shelter and helped animals. She recently or is going to graduate from Dixie callage and she loves to shop.", imageName: "rachel2")
            
        case amyButton:
            vc.person = Person(name: "Amy Stokes", detail: "Amy is my youngest sister and from time to time she is my mini me in some ways. she is currently in a wresstling team in her school. she loves haning out with her possy of friends and doing crazy things. ", imageName: "amy2")
            
        default:
            vc.person = Person(name: "Error", detail: "Empty", imageName: " ")
        }
    }
}

