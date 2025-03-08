//
//  FoodTableVC.swift
//  LabMealTracker
//
//  Created by Sasha Cummings on 3/6/25.
//

import UIKit

class FoodTableVC: UITableViewController {
    
    var meals: [Meal] {
        return [
            Meal(name: "Breakfast", food: [
                Food(name: "Pancakes", description: "Fluffy pancakes with syrup"),
                Food(name: "Scrambled Eggs", description: "Eggs with a bit of cheese"),
                Food(name: "Bacon", description: "Crispy fried bacon strips")
            ]),
            Meal(name: "Lunch", food: [
                Food(name: "Sandwich", description: "Ham and cheese sandwich"),
                Food(name: "Salad", description: "Caesar salad with dressing"),
                Food(name: "Soup", description: "Tomato soup with croutons")
            ]),
            Meal(name: "Dinner", food: [
                Food(name: "Steak", description: "Grilled steak with garlic butter"),
                Food(name: "Mashed Potatoes", description: "Creamy mashed potatoes"),
                Food(name: "Vegetables", description: "Steamed broccoli and carrots")
            ])
        ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return meals.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return meals[section].food.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food", for: indexPath)
        let meal = meals[indexPath.section]
        let food = meal.food[indexPath.row]
        
        cell.textLabel?.text = food.name
        cell.detailTextLabel?.text = food.description
        
        return cell
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meals[section].name
    }
}
