import UIKit

/*class Person {
    
    var firstName: String
    var middleName: String?
    var lastName: String
    var address: String
    var phoneNumber: String?
    
    public init(firstname: String,middlename: String?, lastname: String,address: String, phonenumber: String?) {
        self.firstName = firstname
        self.lastName = lastname
        self.middleName = middlename
        self.address = address
        self.phoneNumber = phonenumber
        
        print("I am the parent class")
        
    }
    
    
    func getFullAddress() -> String {
        
        let middlename = self.middleName ?? ""
        return "\(firstName) \(middlename) \(lastName) whoose address is \(address)"
    }
    
    func getDuties() -> String{
        return ""
    }
    
    
    
}
    


class Student:Person {
    
    
    var overAllCgpa: Double
    
    init(firstname: String, middlename: String?, lastname: String, address: String, phonenumber: String?, overAllCgpa:Double) {
        
        self.overAllCgpa = overAllCgpa
        super.init(firstname: firstname, middlename: middlename, lastname: lastname, address: address, phonenumber: phonenumber)
    }
    
    func getoverAllCgpa() -> String {
        return " CGPA is \(overAllCgpa)"
    }
    
    override func getDuties() -> String {
        return "Be AN Obidient student"
    }
    

    
}


class Teacher :Person {
    
    
    var overAllSalary: Double
    
    public init(firstname: String, middlename: String?, lastname: String, address: String, phonenumber: String?, overAllSalary: Double) {
        
        self.overAllSalary = overAllSalary
        super.init(firstname: firstname, middlename: middlename, lastname: lastname, address: address, phonenumber: phonenumber)
    }
    
    func getoverAllSalary() -> String {
        return " Salary is \(overAllSalary)"
    }
    
    override func getDuties() -> String {
        return "Be a good and kind teacher"
    }
    
    
}


var student:Student = Student(firstname: "Sadaf", middlename: nil, lastname: "Fatin", address: "4305  Holly Street", phonenumber: nil , overAllCgpa: 0)

var teacher:Teacher = Teacher(firstname: "Abdur", middlename: nil, lastname: "Rahim", address: "4305  Holly Street", phonenumber: "+880022233", overAllSalary:1000)

print(student.getDuties() + student.getoverAllCgpa())
print(teacher.getDuties() + teacher.getoverAllSalary())

*/

class Person {
    var name: String
    var age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
let john = Person(name: "John", age: 21)
var steven = john
steven.name = "Steven"
print(john.name)
