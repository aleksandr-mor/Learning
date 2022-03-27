//
//  ViewController.swift
//  GCD
//
//  Created by Aleksandr Morozov on 27.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UNCOMMENT FOLLOWING LINES
        
        // simpleQueuesWithSync()
        // simpleQueuesWithAsync()
        // queuesWithQos()
        
        concurrentQueues()
        
    }
}

extension ViewController {
    
    func simpleQueuesWithSync() {
        let queue = DispatchQueue(label: "com.simple.Queue")
        
        queue.sync {
            for i in 0..<10 {
                print("i is \(i)")
            }
        }
        
        for i in 100..<110 {
            print("i in normalloop is \(i)")
        }
        
    }
    
    func simpleQueuesWithAsync() {
        let queue = DispatchQueue(label: "com.simple.Queue")
        
        queue.async {
            for i in 0..<10 {
                print("i is \(i)")
            }
        }
        
        for i in 10..<20 {
            print("i is \(i)")
        }
        
        for i in 100..<110 {
            print("i in normalloop is \(i)")
        }
        
        
    }
    
    func queuesWithQos()  {
        let queue1 = DispatchQueue(label: "com.simple.queue1", qos: .background)
        let queue2 = DispatchQueue(label: "com.simple.queue2", qos: .userInitiated)
        
        
        queue1.async {
            for i in 0..<10 {
                print("i in first is \(i)")
            }
        }
        
        queue2.async {
            for i in 10..<20 {
                print("i in second is \(i)")
            }
        }
    }
    
    func concurrentQueues()  {
        let anotherQueue = DispatchQueue(label: "com.appcoda.anotherQueue", attributes: .concurrent)
        
        
        anotherQueue.async {
            for i in 0..<10 {
                print("i in first is \(i)")
            }
        }
        
        anotherQueue.async {
            for i in 10..<20 {
                print("i in first is \(i)")
            }
        }
        
        anotherQueue.async {
            for i in 20..<30 {
                print("i in first is \(i)")
            }
        }
    }
}

