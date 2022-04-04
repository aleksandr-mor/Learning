//
//  ViewController.swift
//  CoreDataUpdateDelete
//
//  Created by Aleksandr Morozov on 04.04.2022.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    func createData() {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        guard let userEntity = NSEntityDescription.entity(forEntityName: "User", in: managedContext) else { return }
        for i in 1...5 {
            let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
            user.setValue("mps \(i)", forKey: "username")
            user.setValue("mps \(i)@yopmail.com", forKey: "email")
            user.setValue("mps \(i)#1", forKey: "password")
        }
        
        do {
            try managedContext.save()
            debugPrint("Data saved")

        } catch let error as NSError {
            debugPrint(error)
        }
    }
    
    func retriveData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
//        fetchRequest.predicate = NSPredicate(format: "username = %@", "mps")
//        fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "username", ascending: true)]
        
        do {
            guard let result = try managedContext.fetch(fetchRequest) as? [NSManagedObject] else {
                return
            }
            debugPrint("Saved values")
            for data in result {
                debugPrint(data.value(forKey: "email") as? String ?? "")
            }
        } catch let error as NSError {
            debugPrint(error)
        }
    }
    
    func updateData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchRequest.predicate = NSPredicate(format: "username = %@", "mps 2")
        
        do {
            guard let result = try managedContext.fetch(fetchRequest) as? [NSManagedObject] else {
                return
            }
            guard let objc = result.first else { return }
            objc.setValue("mpsMain@yopmail.com", forKey: "email")
            do {
                try managedContext.save()
                debugPrint("Data Updated")
            } catch let error as NSError {
                debugPrint(error)
            }
        } catch let error as NSError {
            debugPrint(error)
        }
    }
    
    func deleteDate() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchRequest.predicate = NSPredicate(format: "username = %@", "mps 2")
        
        do {
            guard let result = try managedContext.fetch(fetchRequest) as? [NSManagedObject] else {
                return
            }
            guard let objc = result.first else { return }
            managedContext.delete(objc)
            
            do {
                try managedContext.save()
                debugPrint("Record deleted")
            } catch let error as NSError {
                debugPrint(error)
            }
        } catch let error as NSError {
            debugPrint(error)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

