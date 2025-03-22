//
//  FamilyTypeTVC.swift
//  lab introduce family
//
//  Created by Sasha Cummings on 3/19/25.
//

import UIKit

class FamilyTypeTVC: UITableViewController {
        
        var myFamily: [Person] = [
            Person(name: "Sasha Cummings", detail: "RelationShip: Me", imageName: "me4", age: "Age: 32", relationship: "IT'S ME! I am 32. Like my dad, I am self-employed, only instead of selling music I sell 3D printed toys and more. I love dressing up and going to themed events. I also love writing stories and drawing anything fantasy."),
            Person(name: "Jayden Cummings", detail: "Relationship: My Husband", imageName: "jayden4", age: "Age: 30", relationship: "Jayden is my wonderful and kind husband. He likes nerdy things like D&D. He also loves to play video games. He is a homebody and really enjoys eating cookies."),
            Person(name: "Adrian Cummings", detail: "Relationship: My Son", imageName: "adrian5", age: "Age: 2", relationship: "Adrian is our little boy. He is full of energy and more often than not very happy. Though he doesn’t say much, he is very chatty and lets you know what he wants when he wants. He loves McQueen from Cars and Bam from Batwheels (Batman animation)."),
            Person(name: "Clove", detail: "Relationship: My Cat", imageName: "clove1", age: "Age: Unknown", relationship: "Clove is a sister to Roo. She is very chatty, and she vibrates when she purrs. She is very sassy in her own way, and if she finds Momma alone, she is always quick to say hey... I want to be on your lap! Sometimes we have talks too."),
            Person(name: "Roo", detail: "Relationship: Other Cat", imageName: "roo4", age: "Age: Also Unkown", relationship: "Roo is not like her sister, and sometimes a little lazy when climbing a bannister or anything. She would rather slide down her perch than get up and then get down. She doesn't talk a lot, and when she does, it's a 'merp'.")
        ]
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.title = "Family Members"
            
        }
        
        override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return myFamily.count
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyFamilyCell") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "MyFamilyCell")
            let familyMember = myFamily[indexPath.row]
            cell.textLabel?.text = familyMember.name
            cell.detailTextLabel?.text = familyMember.detail
            return cell
        }
        
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let selectedPerson = myFamily[indexPath.row]
            print("Preforming segue to showDetail")
            performSegue(withIdentifier: "showDetail", sender: selectedPerson)
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showDetail",
               let destinationVC = segue.destination as? DetailVC,
               let selectedPerson = sender as? Person {
                destinationVC.person = selectedPerson
        }
    }
}
