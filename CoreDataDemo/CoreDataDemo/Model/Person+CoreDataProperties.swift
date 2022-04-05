//
//  Person+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by Aleksandr Morozov on 05.04.2022.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var age: Int64
    @NSManaged public var name: String?
    @NSManaged public var gender: String?

}

extension Person : Identifiable {

}
