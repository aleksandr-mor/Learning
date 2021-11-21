//import UIKit
//
//var age: Int? = nil
//age = 38
//
////MARK: - if let
//
//var name: String? = nil
//
//name = "Buzinga"
//
//if let unwrapped = name {
//    print("\(unwrapped.count) letters")
//} else {
//    print("Missing name.")
//}
//
////MARK: - guard let
//
//func greet(_ name: String?) {
//    guard let unwrapped = name else {
//        print("You didn't provide a name!")
//        return
//    }
//
//    print("Hello, \(unwrapped)!")
//}
//
////MARK: - Force unwrapping
//
//let str = "5"
//let num = Int(str)!
//
////MARK: - Implicitly unwrapped optionals
//
//let age: Int! = nil
//
////MARK: - Nil coalescing (if nil ?? than)
//
//func username(for id: Int) -> String? {
//    if id == 1 {
//        return "Taylor Swift"
//    } else {
//        return nil
//    }
//}
//
//let user = username(for: 15) ?? "Anonymous"

//MARK: - Optional chaining

let names = ["John", "Paul", "George", "Ringo"]
let beatle = names.first?.uppercased()

//MARK: - Optional try

enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}

if let result = try? checkPassword("password") { //try! checkpassword("sekrit")
    print("Result was \(result)") // print("OK!")
} else {
    print("D'oh.")
}

//MARK: - Failable initializers

let str = "5"
let num = Int(str)

struct Person {
    var id: String

    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

//MARK: - Typecasting

class Animal { }
class Fish: Animal { }

class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}

let pets = [Fish(), Dog(), Fish(), Dog()]

for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}
