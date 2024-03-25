//
//  TaskFivePointTwoViewController.swift
//  Multithreading
//
//  Created by Vakil on 24.03.2024.
//

import UIKit

class TaskFivePointTwoViewController: UIViewController {
    /* отличий нету */
    override func viewDidLoad() {
        super.viewDidLoad()
        print(1)
        print(Thread.current)
        Task {
                self.example()
            print("2")
            print("3")
        }
    }
   @MainActor func example() {
        print("Example", Thread.current)
    }
    
}

