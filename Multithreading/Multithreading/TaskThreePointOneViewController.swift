//
//  TaskThreePointOneViewController.swift
//  Multithreading
//
//  Created by Vakil on 21.03.2024.
//

import UIKit

class TaskThreePointOneViewController: UIViewController {
/*Наберите весь код руками. Дан сервис, через который записываем фразы в массив используя цикл. 1) Используя DispatchQueue.global() записывайте фразы через цикл, а не через main thread. 2) Решить проблему потокобезопасности phrases
    через семафор. 3) Решить проблему, используя actor вместо класса.*/
    
    var semaphore = DispatchSemaphore(value: 0)
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Start")
        let phasesServis = PhasesServis()
        
        ///1
        for i in 0..<10 {
            DispatchQueue.global().async {
                Task {
                    print(Thread.current)
                    await phasesServis.addPhases("Pharse \(i)")
                }
            }
            
        }
        Thread.sleep(forTimeInterval: 1)
        Task {
            let phases = await phasesServis.phases
            print(phases)
        }
    }
}

actor PhasesServis {
    let semaphore = DispatchSemaphore(value: 1)
     var phases: [String] = []
    
    func addPhases(_ phase: String) async {
        semaphore.wait()
        phases.append(phase)
        semaphore.signal()
    }
}

