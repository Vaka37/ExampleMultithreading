//
//  TaskFourModuleTwo.swift
//  Multithreading
//
//  Created by Vakil on 22.03.2024.
//

import UIKit

protocol RMOperationProtocol {
    // Приоритеты
    var priority: DispatchQoS.QoSClass { get }
    // Выполняемый блок
    var completionBlock: (() -> Void)? { get }
    // Завершена ли операция
    var isFinished: Bool { get }
    // Метод для запуска операции
    func start()
}

class RMOperation: RMOperationProtocol {
    var isExecuting: Bool = false
    
    var priority: DispatchQoS.QoSClass
    var completionBlock: (() -> Void)?
    var isFinished: Bool = false

    init(priority: DispatchQoS.QoSClass, completionBlock: ( () -> Void)? = nil) {
        self.priority = priority
        self.completionBlock = completionBlock
    }

    /// В методе start. реализуйте все через глобальную паралельную очередь с приоритетами.
    func start() {
        DispatchQueue.global().sync {
            self.completionBlock?()
        }

        DispatchQueue.global().sync {
            self.isFinished = true
        }
    }

}


class TaskFourModuleTwo: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let operationFirst = RMOperation(priority: .utility)
        let operationSecond = RMOperation(priority: .utility)
        
        
        operationFirst.priority = .userInitiated
        operationFirst.completionBlock = {
            
            for _ in 0..<50 {
                print(2)
            }
            print(Thread.current)
            print("Операция полностью завершена!")
        }
        
        operationFirst.start()
        
        
        
        operationSecond.priority = .background
        operationSecond.completionBlock = {
            
            for _ in 0..<50 {
                print(1)
            }
            print(Thread.current)
            print("Операция полностью завершена!")
        }
        operationSecond.start()
        
    }
}
