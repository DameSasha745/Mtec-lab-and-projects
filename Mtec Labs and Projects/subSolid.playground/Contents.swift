import UIKit

protocol Bread {
    var name: String { get }
}
protocol Meat {
    var name: String { get }
}
protocol Cheese {
    var name: String { get }
}
protocol Veggies {
    var name: String { get }
}
protocol Dressing {
    var name: String { get }
}


class SourDough: Bread {
    var name: String { return "SourDough" }
}
class CheeseCrusted: Bread {
    var name: String { return "CheeseCrusted" }
}
class Wheat: Bread {
    var name: String { return "Wheat" }
}
class FlatBread: Bread {
    var name: String { return "FlatBread" }
}


class TurkeyMeat: Meat {
    var name: String { return "Turkey" }
}
class HamMeat: Meat {
    var name: String { return "Ham" }
}
class RoastBeef: Meat {
    var name: String { return "Roast Beef" }
}
class Bacon: Meat {
    var name: String { return "Bacon" }
}


class CheddarCheese: Cheese {
    var name: String { return "Cheddar Cheese" }
}
class SwissCheese: Cheese {
    var name: String { return "Swiss Cheese" }
}
class Shredded: Cheese {
    var name: String { return "Shredded" }
}
class ProvoloneCheese: Cheese {
    var name: String { return "Provolone Cheese" }
}


class Lettuce: Veggies {
    var name: String { return "Lettuce" }
}
class Tomato: Veggies {
    var name: String { return "Tomato" }
}
class Olives: Veggies {
    var name: String { return "Olives" }
}
class Spinach: Veggies {
    var name: String { return "Spinach" }
}

class Mayo: Dressing {
    var name: String { return "Mayo" }
}
class Mustard: Dressing {
    var name: String { return "Mustard" }
}
class Ranch: Dressing {
    var name: String { return "Ranch" }
}
class Chiotle: Dressing {
    var name: String { return "Chiotle" }
}


class Sandwich {
    var bread: Bread
    var meat: Meat
    var cheese: Cheese
    var veggies: [Veggies]
    var dressing: Dressing
    var size: String
    var toasted: Bool
    
    init(bread: Bread, meat: Meat, cheese: Cheese, veggies: [Veggies], dressing: Dressing, size: String, toasted: Bool) {
        self.bread = bread
        self.meat = meat
        self.cheese = cheese
        self.veggies = veggies
        self.dressing = dressing
        self.size = size
        self.toasted = toasted
    }
    func describe() -> String {
        let veggieNames = veggies.map { $0.name }.joined(separator: ", ")
        return """
        Sandwich Details:
        Bread: \(bread.name)
        Meat: \(meat.name)
        Cheese: \(cheese.name)
        Veggies: \(veggieNames)
        Dressing: \(dressing.name)
        Size: \(size)
        Toasted: \(toasted ? "Yes" : "No")
        """
    }
}

class SandwichOrder {
    var breadOption: Bread
    var meatOption: Meat
    var cheeseOption: Cheese
    var veggiesOption: [Veggies]
    var dressingOption: Dressing
    var sizeOption: String
    var toastedOption: Bool
    
    init(bread: Bread, meat: Meat, cheese: Cheese, veggies: [Veggies], dressing: Dressing, size: String, toasted: Bool) {
        self.breadOption = bread
        self.meatOption = meat
        self.cheeseOption = cheese
        self.veggiesOption = veggies
        self.dressingOption = dressing
        self.sizeOption = size
        self.toastedOption = toasted
    }
    func createSandwich() -> Sandwich {
        return Sandwich(bread: breadOption, meat: meatOption, cheese: cheeseOption, veggies: veggiesOption, dressing: dressingOption, size: sizeOption, toasted: toastedOption)
    }
}
let breadOption = SourDough()
let meatOption = TurkeyMeat()
let cheeseOption = SwissCheese()
let veggiesOption: [Veggies] = [Spinach(), Tomato()]
let dressingOption = Chiotle()
let sizeOption = "12 inch"
let toastedOption = true

let order = SandwichOrder(bread: breadOption, meat: meatOption, cheese: cheeseOption, veggies: veggiesOption, dressing: dressingOption, size: sizeOption, toasted: toastedOption)

let sandwich = order.createSandwich()
print(sandwich.describe())
