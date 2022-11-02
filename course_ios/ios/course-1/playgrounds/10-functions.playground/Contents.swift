import UIKit

//Shape 1
var length = 5
var width = 10

var area = length * width

//Shape 2
var length2 = 6
var width2 = 12

var area2 = length * width2

//Shape 3
var length3 = 3
var width3 = 8

var area3 = length * width

func calculateArea(length: Int, width: Int) -> Int {
    return length * width
}

let shape1 = calculateArea(length: 5, width: 4)
let shape2 = calculateArea(length: 6, width: 2)
let shape3 = calculateArea(length: 4, width: 4)

var bankAccountBalance = 500.00
var sigourneyWeaverAlientStomperShoes = 350.00

/*
func purchaseItem(currentBalance: Double, itemPrice: Double) -> Double {
    if itemPrice <= currentBalance {
        print("Purchased item for: $\(itemPrice)")
        return currentBalance - itemPrice
    } else {
        print("You are broke. You should learn how to save money.")
        return currentBalance
    }
}

let newBalance = purchaseItem(currentBalance: bankAccountBalance, itemPrice: sigourneyWeaverAlientStomperShoes)

*/

func purchaseItem(currentBalance: inout Double, itemPrice: Double){
    if itemPrice <= currentBalance {
        currentBalance = currentBalance - itemPrice
        print("Purchased item for: $\(itemPrice)")
    } else {
        print("You are broke. You should learn how to save money.")
    }
}

purchaseItem(currentBalance: &bankAccountBalance, itemPrice: sigourneyWeaverAlientStomperShoes)

var retroLunchBox = 40.00
purchaseItem(currentBalance: &bankAccountBalance, itemPrice: retroLunchBox)


var totalPerson:Double = 50

func costperLunchBox(totalCost:Double, totalPerson: inout Double) -> Double {
    totalPerson+=1
    return totalCost/totalPerson
}

costperLunchBox(totalCost:3000.40, totalPerson: &totalPerson)


func display(names: String...) {
    print("Friends:", names.joined(separator: ", "))
}

display(names: "Tom", "Larry", "Moe")

var people = Dictionary<String,String>()
people["Bob"] = "Smith"
print(people.count)


let card = "Aces"

switch card {
case "Aces":
    fallthrough

case "Spades", "Clovers", "Hearts":
    print("Spades Clovers Hearts")

default:
    print("No Card")
}
let numbers = [1, 3, 5, 7, 9]
let result = numbers.map { $0 * 10 }

var trees = [String]()
trees.reserveCapacity(2)
trees.append("Oak")
trees.append("Redwood")
trees.append("Evergreen")
print(trees.count)
