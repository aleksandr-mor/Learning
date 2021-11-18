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


