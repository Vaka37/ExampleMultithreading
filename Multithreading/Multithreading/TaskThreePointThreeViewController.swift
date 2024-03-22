//
//  TaskThreePointThreeViewController.swift
//  Multithreading
//
//  Created by Vakil on 21.03.2024.
//

import UIKit

class TaskThreePointThreeViewController: UIViewController {
    
    let serialQueue = DispatchQueue(label: "com.example.myQueue")
    override func viewDidLoad() {
        super.viewDidLoad()
        ///1. дедлок меняем sync на async
        serialQueue.async {
            self.serialQueue.async {
                print("This will never be printed.")
            }
        }
    }
}


