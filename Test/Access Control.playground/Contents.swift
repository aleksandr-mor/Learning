import UIKit

struct Person {
   private var id: String
    
    init(id: String) {
        self.id = id
    }
    func identify() -> String {
        return "My social security number is \(id)"
    }
}

let ed = Person(id: "12345")


struct Employee {
    var name: String
    var yearsActive = 0
}

let reslin = Employee(name: "Laura Roslin")
let adama = Employee(name: "William Adama", yearsActive: 45)

struct Employee {
    var name: String
    var yearsActive = 0
    
    init() {
        self.name = "Anonymous"
        print("Creating an anonymous employee...")
    }
}


struct Employee {
    var name: String
    var yearsActive = 0
}

extension Employee {
    init() {
        self.name = "Anonymous"
        print("Creating an anonymous employee...")
        }
    
}

// creating a named employee now works
let roslin = Employee(name: "Laura Roslin")

// as does creating an anonymous employee
let anon = Employee()

struct Student {
    var name: String
    var bestFriend: String
    
    init(name: String, bestFriend: String) {
        print("Enrolling \(name) in class...")
        self.name = name
        self.bestFriend = bestFriend
    }
}

struct Unwrap {
    static let appURL = "http://itunes.apple,com/app/id1440611372"
    static var entropy = Int.random(in: 1...1000)
    
    static func getEntrope() -> Int {
        entropy += 1
        return entropy
    }
}
Unwrap.appURL

//MARK: - Private

private var learnedSections = Set<String>()




