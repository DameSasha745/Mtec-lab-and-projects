/*:
## Exercise - Type Casting and Inspection

 Create a collection of type [Any], including a few doubles, integers, strings, and booleans within the collection. Print the contents of the collection.
 */
var collection: [Any] = [2.2, 7, "Sasha Cummings", 3.5, true]
print(collection)
//:  Loop through the collection. For each integer, print "The integer has a value of ", followed by the integer value. Repeat the steps for doubles, strings and booleans.
for item in collection {
    if let Int = item as? Int {
        print(Int)
    } else if let Double = item as? Double {
        print(Double)
    } else if let String = item as? String{
        print(String)
    } else if let Bool = item as? Bool {
        print(Bool)
    }
    
    //:  Create a [String : Any] dictionary, where the values are a mixture of doubles, integers, strings, and booleans. Print the key/value pairs within the collection
    var _: [String:Any] = ["Sasha": 5.5, "Jayden": 31, "Adrian": "little kido", "I am mom": true]
    //:  Create a variable `total` of type `Double` set to 0. Then loop through the dictionary, and add the value of each integer and double to your variable's value. For each string value, add 1 to the total. For each boolean, add 2 to the total if the boolean is `true`, or subtract 3 if it's `false`. Print the value of `total`.
    let dictionary: [String: Any] = ["int": 7, "Double": 3.8, "string": "boom",  "boolean": false]
    var total : Double = 0.0
    for value in dictionary.values {
        if let intValue = value as? Int {
            total += Double(intValue)
        } else if let doubleValue = value as? Double {
            total += doubleValue
        } else if let stringValue = value as? String {
            total += 1
        } else if let boolValue = value as? Bool {
            total += boolValue ? 2 : -3
        }
    }
    print("total is \(total)")
    //:  Create a variable `total2` of type `Double` set to 0. Loop through the collection again, adding up all the integers and doubles. For each string that you come across during the loop, attempt to convert the string into a number, and add that value to the total. Ignore booleans. Print the total.
    
    var total2: Double = 0.0
    for value in dictionary.values {
        if let intValue = value as? Int {
            total += Double(intValue)
        } else if let doubleValue = value as? Double {
            total += doubleValue
        } else if let stringValue = value as? String {
            total += 1
        }
        
    }
    
    print("total is \(total2)")
    /*:
     page 1 of 2  |  [Next: App Exercise - Workout Types](@next)
     */
}
