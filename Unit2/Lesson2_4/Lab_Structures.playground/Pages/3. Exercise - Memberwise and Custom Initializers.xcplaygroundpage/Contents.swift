/*:
## Exercise - Memberwise and Custom Initializers
 
 If you completed the exercise Structs, Instances, and Default Values, you created a `GPS` struct with default values for properties of `latitude` and `longitude`. Create your `GPS` struct again, but this time do not provide default values. Both properties should be of type `Double`.
 */
struct GPS {
    var longitude: Double
    var latitude: Double

}
//:  Now create a constant instance of `GPS` called `somePlace`, and use the memberwise initializer to set `latitude` to 51.514004, and `longitude` to 0.125226. Print the values of `somePlace`'s properties.
let somePlace = GPS(longitude: 51.514004, latitude: 0.125226)
print("latitude = \(somePlace.latitude)")
print("longitude = \(somePlace.longitude)")

//:  In Structs, Instance, and Default Values, you also created a `Book` struct with properties `title`, `author`, `pages`, and `price`. Create this struct again without default values. Give each property the appropriate type. Declare your `favoriteBook` instance and pass in the values of your favorite book using the memberwise initializer. Print a statement about your favorite book using `favoriteBook`'s properties.
struct Book {
    var title: String
    var author: String
    var pages: Int
    var price: Int
    
    
}
let favouriteBook = Book(title: "The Purpose Driven Life", author: "Rick Warren", pages: 368, price: 12)
print(favouriteBook)


/*:
 Make a `Laptop` struct with three variable properties, `screenSize` of type `Int`, `repairCount` of type `Int`, and `yearPurchased` of type `Int`. Give `screenSize` a default value of `13` and `repairCount` a default value of `0`, and leave `yearPurchased` without a default value. Declare two instances of `Laptop`, using the two provided memberwise initializers.
 */
struct Laptop {
    var screenSize: Int = 13
    var repairCount: Int = 0
    var yearPurchased: Int
}
let instance1 = Laptop(yearPurchased: 2022)
let instance2 = Laptop(screenSize: 15,repairCount: 3, yearPurchased: 2011)

/*:
 Make a `Height` struct with two variable properties, `heightInInches` and `heightInCentimeters`. Both should be of type `Double`.
 
 Create two custom initializers. One initializer will take a `Double` argument that represents height in inches. The other initializer will take a `Double` argument that represents height in centimeters. Each initializer should take the passed in value and use it to set the property that corresponds to the unit of measurement passed in. It should then set the other property by calculating the right value from the passed in value. Hint: *1 inch = 2.54 centimeters*.

 - Example: If you use the initializer for inches to pass in a height of 65, the initializer should set `heightInInches` to 65 and `heightInCentimeters` to 165.1.
 */
struct Height {
    var heightInInches: Double
    var heightInCentimeters: Double
    
    init(inch: Double) {
        self.heightInInches = inch
        self.heightInCentimeters = inch * 2.54
    }
    
    init(centimeters: Double) {
    self.heightInCentimeters = centimeters
    self.heightInInches = centimeters / 2.54
    
}
}


let centi = Height(inch: 90)
print(centi.heightInCentimeters)

let inches = Height(centimeters: 180)
print(inches.heightInInches)
        
//:  Now create a variable instance of `Height` called `someonesHeight`. Use the initializer for inches to set the height to 65. Print out the property for height in centimeters and verify that it is equal to 165.1.
var someonesHeight = Height(inch: 65)
print(someonesHeight.heightInCentimeters)
//:  Now create a variable instance of `Height` called `myHeight` and initialize it with your own height. Verify that both `heightInInches` and `heightInCentimeters` are accurate.
var myHeight = Height(centimeters: 182)  //
print(myHeight.heightInInches)
print(myHeight.heightInCentimeters)


/*:
[Previous](@previous)  |  page 3 of 10  |  [Next: App Exercise - Users and Distance](@next)
 */
