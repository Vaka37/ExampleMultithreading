//
//  TaskThreeModulTwo.swift
//  Multithreading
//
//  Created by Vakil on 22.03.2024.
//

import UIKit

class TaskThreeModulTwo: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //2. гонка за данными
        var sharedResource = 0

        DispatchQueue.global(qos: .userInteractive).sync {
            for _ in 1...100 {
                sharedResource += 1
            }
            print("finish 1")
        }

        DispatchQueue.global(qos: .background).async {
            for _ in 1...100 {
                sharedResource += 1
            }
            print("finish 2")
        }
    }
}
