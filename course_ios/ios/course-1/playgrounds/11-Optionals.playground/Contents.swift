import UIKit

//struct Person {
//    var firstName:String
//    var middleName:String?
//    var lastName:String
//    func printFullName() {
//
//        let middle = middleName ?? ""
//        print("\(firstName) \(middle)\(lastName)")
//
//    }
//
//
//}
//var personOne = Person(firstName: "Sadaf", middleName: nil, lastName: "Fatin")
//personOne.printFullName()


class Person {
    
    var firstName:String
    var middleName:String?
    var lastName:String
    var spouse:Person?
    
    
    init(firstName: String, middleName: String?, lastName: String, spouse:Person?) {
        self.firstName = firstName
        self.middleName = middleName
        self.lastName = lastName
        self.spouse = spouse
        
    }
    
    func getFullName() -> String {
        let middle = middleName ?? ""
        return ("\(firstName) \(middle)\(lastName)")
        
    }
    
    
}

var personOne = Person(firstName: "Sadaf", middleName: nil, lastName: "Fatin", spouse: nil)

if let spouseName = personOne.spouse?.getFullName() {
    print(spouseName)
}
else{
    print(" Dont have a spouse")
}
    
// chain optional
print(personOne.spouse?.getFullName() ?? " Dont have a spouse")
