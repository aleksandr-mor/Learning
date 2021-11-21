import UIKit

protocol Identifiable {
    var id: String { get set }
}

struct User: Identifiable {
    var id: String
}

func displayID(thing: Identifiable) {
    print("My ID is \(thing.id)")
}

//MARK: - NEXT

struct Book {
    var name: String
}

func buy(_ book: Book) {
    print("I'm buying \(book.name)")
}

//MARK: - NEXT

protocol Purchaseable {
    var name: String { get set }
}

struct Book: Purchaseable {
    var name: String
    var author: String
}

struct Movie: Purchaseable {
    var name: String
    var actors: [String]
}

struct Car: Purchaseable {
    var name: String
    var manufacturer: String
}

struct Coffee: Purchaseable {
    var name: String
    var strength: Int
}

func buy(_ item: Purchaseable) {
    print("I'm buying \(item.name)")
}

//MARK: - NEXT

protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

protocol Employee: Payable, NeedsTraining, HasVacation { }

//MARK: - NEXT

protocol Computer {
    var price: Double { get set }
    var weight: Int { get set }
    var cpu: String { get set }
    var memory: Int { get set }
    var storage: Int { get set }
}

protocol Laptop {
    var price: Double { get set }
    var weight: Int { get set }
    var cpu: String { get set }
    var memory: Int { get set }
    var storage: Int { get set }
    var screenSize: Int { get set }
}
//MARK: - NEXT
protocol Product {
    var price: Double { get set }
    var weight: Int { get set }
}

protocol Computer: Product {
    var cpu: String { get set }
    var memory: Int { get set }
    var storage: Int { get set }
}

protocol Laptop: Computer {
    var screenSize: Int { get set }
}

//MARK: - Protocol Extensions

let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])

extension Collection {
    func summarize() {
        print("There are \(count) of us:")

        for name in self {
            print(name)
        }
    }
}

pythons.summarize()
beatles.summarize()

//MARK: - NEXT

let numbers = [4, 8, 15, 16]
let allEven = numbers.allSatisfy { $0.isMultiple(of: 2) }

let numbers2 = Set([4, 8, 15, 16])
let allEven2 = numbers2.allSatisfy { $0.isMultiple(of: 2) }

let numbers3 = ["four": 4, "eight": 8, "fifteen": 15, "sixteen": 16]
let allEven3 = numbers3.allSatisfy { $0.value.isMultiple(of: 2) }

//MARK: - Protocol-oriented programming

protocol Identifiable {
    var id: String { get set }
    func identify()
}

extension Identifiable {
    func identify() {
        print("My ID is \(id).")
    }
}

struct User: Identifiable {
    var id: String
}

let twostraws = User(id: "twostraws")
twostraws.identify()

