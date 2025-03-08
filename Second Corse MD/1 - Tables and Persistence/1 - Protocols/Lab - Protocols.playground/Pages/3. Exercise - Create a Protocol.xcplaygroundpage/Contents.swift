/*:
## Exercise - Create a Protocol
 
 Create a protocol called `Vehicle` with two requirements: a nonsettable `numberOfWheels` property of type `Int`, and a function called `drive()`.
 */
protocol vehicle {
    var numberOfWeels: Int { get }
    
    func drive()
        
}

//:  Define a `Car` struct that implements the `Vehicle` protocol. `numberOfWheels` should return a value of 4, and `drive()` should print "Vroom, vroom!" Create an instance of `Car`, print its number of wheels, then call `drive()`.

// need help

struct Car: vehicle {
    var numberOfWeels: Int {
    return 4
}
    func drive() {
        print("Vroom vroom")
    }
}
let myCar = Car()
print("number of weels: \(myCar.numberOfWeels)")
myCar.drive()
/*:
[Previous](@previous)  |  page 3 of 5  |  [Next: App Exercise - Similar Workouts](@next)
 */
