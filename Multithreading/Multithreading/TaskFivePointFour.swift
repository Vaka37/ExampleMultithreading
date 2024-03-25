//
//  TaskFivePointFour.swift
//  Multithreading
//
//  Created by Vakil on 25.03.2024.
//

import UIKit

class TaskFivePointFour: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task{
            let result = await randomD6()
            print(result)
        }
    }
    
    func randomD6() async -> Int {
        Int.random(in: 1...6)
    }
}
