//
//  TaskFourViewController.swift
//  Multithreading
//
//  Created by Vakil on 20.03.2024.
//

import UIKit

final class TaskFiveViewController: UIViewController {
    /*ничего не поменялось потому что это практически одно и тоже  */
    override func viewDidLoad() {
        super.viewDidLoad()
                print("1")
                Task {
                    print("2")
                }
                print("3")
            }
//        Task {
//            await sum()
//        }
    }
    
    func weather(complition: @escaping([Double]) -> Void) {
        DispatchQueue.global().async {
            print("1")
            complition([1.0])
        }
    }

    func weatherAsync() async -> String {
        print("finishOne")
        return "Road"
    }
    func stingTwo() async -> String {
        print("finishTwo")
        return "map"
    }
    
    func stringThree() async -> String {
        print("FinishFree")
        return "Vaka"
    }
    
    func sum() async  {
        sleep(1)
        let one = await weatherAsync()
        sleep(1)
        let two = await stingTwo()
        sleep(1)
        let three = await stringThree()
        
        print(one + two + three)
    }
