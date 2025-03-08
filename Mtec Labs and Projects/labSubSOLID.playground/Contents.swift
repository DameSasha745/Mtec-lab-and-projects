import UIKit

class IsTosted {
    var isTosted: Bool
    init(isTosted: Bool) {
        self.isTosted = isTosted
        func tosted(tostedChoice: String) -> Bool {
            if tostedChoice == String("Yes") {
                return true
            } else {
                return false
            }
        }
    }
}
class SizeChoice {
    var size: String
    init(size: String) {
        self.size = size
        func sizeBread(sizeChoice: String) -> String {
            if sizeChoice == "6 Inch" {
                return sizeChoice
            } else if sizeChoice == "12 Inch" {
                return sizeChoice
            } else {
                return "Invalid Choice!!"
            }
        }
    }
}
    class BreadChoice {
        var bread: String
        init(bread: String) {
            self.bread = bread
            func breadType(breadChoice: String) -> String {
                switch breadChoice {
                case "SourDough":
                    return breadChoice
                case "CheeseCrusted":
                    return breadChoice
                case "Wheat":
                    return breadChoice
                case "FlatBread":
                    return breadChoice
                default:
                    return "Please choose a bread!"
                }
            }
        }
    }
    class MeatChoice {
        var meat: String?
        init(meat: String? = nil) {
            self.meat = meat
            func meatType(meatChoice: String) -> String? {
                switch meatChoice {
                case "Turkey":
                    return meatChoice
                case "Ham":
                    return meatChoice
                case "Roast Beef":
                    return meatChoice
                case "Bacon":
                    return meatChoice
                default:
                    return nil
                }
            }
        }
    }
    class VeggieChoice {
        var veggies: String?
        init(veggies: String? = nil) {
            self.veggies = veggies
            func veggieType(veggieChoice: String) -> String? {
                switch veggieChoice {
                case "Lettuce":
                    return veggieChoice
                case "Tomato":
                    return veggieChoice
                case "Olives":
                    return veggieChoice
                case "Spinach":
                    return veggieChoice
                default:
                    return nil
                }
            }
        }
    }
    class CheeseChoice {
        var cheese: String?
        init(cheese: String? = nil) {
            self.cheese = cheese
            func cheeseType(cheeseChoice: String) -> String? {
                switch cheeseChoice {
                case "Swiss":
                    return cheeseChoice
                case "Chedder":
                    return cheeseChoice
                case "Provolone":
                    return cheeseChoice
                case "Shredded":
                    return cheeseChoice
                default:
                    return nil
                }
            }
        }
    }
    class DressingChoice {
        var dressing: String?
        init(dressing: String? = nil) {
            self.dressing = dressing
            func dressingType(dressingChoice: String) -> String? {
                switch dressingChoice {
                case "Mayo":
                    return dressingChoice
                case "Mustard":
                    return dressingChoice
                case "Ranch":
                    return dressingChoice
                case "Chiotle":
                    return dressingChoice
                default:
                    return nil
                }
            }
        }
    }
class Order {
    var orderChoice =
}
