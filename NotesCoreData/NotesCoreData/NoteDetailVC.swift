//
//  ViewController.swift
//  NotesCoreData
//
//  Created by Aleksandr Morozov on 10.04.2022.
//

import UIKit
import CoreData

class NoteDetailVC: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descTextView: UITextView!
    
    var selectedNote: Note? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(selectedNote != nil) {
            
            titleTextField.text = selectedNote?.title
            descTextView.text = selectedNote?.desc
        }
    }
    
    @IBAction func saveAction(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        
        if(selectedNote == nil) {
            
            let entity = NSEntityDescription.entity(forEntityName: "Note", in: context)
            let newNote = Note(entity: entity!, insertInto: context)
            newNote.id = noteList.count as NSNumber
            newNote.title = titleTextField.text
            newNote.desc = descTextView.text
            
            do {
                try context.save()
                noteList.append(newNote)
                navigationController?.popViewController(animated: true)
            }
            catch {
                print("context save error")
            }
            
            // edit
            
        } else {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
            do {
                let results: NSArray = try context.fetch(request) as NSArray
                for result in results {
                    let note = result as! Note
                    if(note == selectedNote) {
                        note.title = titleTextField.text
                        note.desc = descTextView.text
                        try context.save()
                        navigationController?.popViewController(animated: true)
                    }
                }
            } catch {
                print("Fetch Failed")
            }
        }
    }
    
    @IBAction func deleteNote(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
        do {
            let results: NSArray = try context.fetch(request) as NSArray
            for result in results {
                let note = result as! Note
                if(note == selectedNote) {
                    note.deletedDate = Date()
                    try context.save()
                    navigationController?.popViewController(animated: true)
                }
            }
        } catch {
            print("Fetch Failed")
        }
    }
    
}
