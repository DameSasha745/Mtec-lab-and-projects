/*:
## Exercise - Functions and Optionals

 If an app asks for a user's age, it may be because the app requires a user to be over a certain age to use some of the services it provides. Write a function called `checkAge` that takes one parameter of type `String`. The function should try to convert this parameter into an `Int` value and then check if the user is over 18 years old. If he/she is old enough, print "Welcome!", otherwise print "Sorry, but you aren't old enough to use our app." If the `String` parameter cannot be converted into an `Int` value, print "Sorry, something went wrong. Can you please re-enter your age?" Call the function and pass in `userInputAge` below as the single parameter. Then call the function and pass in a string that can be converted to an integer.
 */
let userInputAge: String = "34e"

func checkAge(userInputAge: String) -> String? {
    
    if let myAge = Int(userInputAge) {
        
        if myAge >= 18 {
            return "welcome"
            
        } else {
            return "Sorry, but you are not old enogh to use our APP."
        }
        
    } else {
        
        return "Sorry, something went wrong, please re-enter you'r age."
        
    }

}

//:  Go back and update your function to return the age as an integer. Will your function always return a value? Make sure your return type accurately reflects this. Call the function and print the return value.
// no becouse the string in the funtion cannot convert a return to an Int.
let result1 = checkAge(userInputAge: "34e")

print(result1!)
/*:
[Previous](@previous)  |  page 3 of 6  |  [Next: App Exercise - Food Functions](@next)
 */
