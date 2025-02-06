/*:
## Exercise - Create Functions

 Write a function called `introduceMyself` that prints a brief introduction of yourself. Call the function and observe the printout.
 */
func IntroduceMySelf(firstName: String,  lastName: String) {
    print("hello \(firstName) \(lastName)")
}
IntroduceMySelf(firstName: "sasha", lastName: "cumminngs")
//:  Write a function called `magicEightBall` that generates a random number and then uses either a switch statement or if-else-if statements to print different responses based on the random number generated. `let randomNum = Int.random(in: 0...4)` will generate a random number from 0 to 4, after which you can print different phrases corresponding to the number generated. Call the function multiple times and observe the different printouts.
import Foundation
func magicEightBall() {
    let randomNumber = Int.random(in: 0...4)
    
    switch randomNumber {
        
    case 0:
        print("you got a 0: \(randomNumber)")
    case 1:
        print("you got a 1 \(randomNumber)")
    case 2:
        print("you got a 2 \(randomNumber)")
    case 3:
        print("you got a 3 \(randomNumber)")
    case 4:
        print("you got a 4 \(randomNumber)")
    default:
        print("why did you roll this high")
    }
}

    magicEightBall()
    


/*:
page 1 of 6  |  [Next: App Exercise - A Functioning App](@next)
 */
