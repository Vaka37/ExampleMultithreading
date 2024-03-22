//
//  TaskThreeModulThree.swift
//  Multithreading
//
//  Created by Vakil on 22.03.2024.
//

import UIKit

class TaskThreeModulThree: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        ///3.  LiveLock(активная блокровка)
        let queqe = DispatchQueue(label: "Live", attributes: .concurrent)

        var people1 = People1()
        var people2 = People2()
        let item = DispatchWorkItem{
            let thread1 = Thread {
                people1.walkPast(with: people2)
            }
            people2.isDifferentDirections = true
            thread1.start()
        }

        item.notify(queue: .main, execute: {
            let thread2 = Thread {
                people2.walkPast(with: people1)
            }
            people1.isDifferentDirections = true
            thread2.start()
        })
        queqe.sync(execute: item)
    }
}

class People1 {
    var isDifferentDirections = false;
    
    func walkPast(with people: People2) {
        while (!people.isDifferentDirections) {
            print("People1 не может обойти People2")
            sleep(1)
        }
        
        print("People1 смог пройти прямо")
        isDifferentDirections = true
    }
}

class People2 {
    var isDifferentDirections = false;
    
    func walkPast(with people: People1) {
        while (!people.isDifferentDirections) {
            print("People2 не может обойти People1")
            sleep(1)
        }
        
        print("People2 смог пройти прямо")
        isDifferentDirections = true
    }
}
