/*:
## Exercise - Structs, Instances, and Default Values
 
 Imagine you are creating an app that will monitor location. Create a `GPS` struct with two variable properties, `latitude` and `longitude`, both with default values of 0.0.
 */
struct GPS {
    var lattitude = 0.0
    var longitude = 0.0
}
//:  Create a variable instance of `GPS` called `somePlace`. It should be initialized without supplying any arguments. Print out the latitude and longitude of `somePlace`, which should be 0.0 for both.
var somePlace = GPS()
print(somePlace.lattitude)

//:  Change `somePlace`'s latitude to 51.514004, and the longitude to 0.125226, then print the updated values.
somePlace.lattitude = 51.514004
somePlace.longitude = 0.125226
 
print(somePlace.lattitude)
print(somePlace.longitude)
//:  Create a variable instance of `Book` called `favoriteBook` without supplying any arguments. Print out the title of `favoriteBook`. Does it currently reflect the title of your favorite book? Probably not. Change all four properties of `favoriteBook` to reflect your favorite book. Then, using the properties of `favoriteBook`, print out facts about the book.
struct book {
    var title:String = ""
    var auther:String = ""
    var nomberOfPages = 0
    var price = 0.0
}
let favoritBook = book(title: "lioness Rampent", auther: "Tamera Peirce", nomberOfPages: 169, price: 5.96)
print(favoritBook)
/*:
page 1 of 10  |  [Next: App Exercise - Workout Tracking](@next)
 */
