//
//  TaskFourModuleThree.swift
//  Multithreading
//
//  Created by Vakil on 22.03.2024.
//

import UIKit

class TaskFourModuleThree: UIViewController {
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let operationFirst = RMOperation(priority: .default)
        let operationSecond = RMOperation(priority: .default)

        operationFirst.priority = .userInitiated
        operationFirst.completionBlock = {

            for _ in 0..<10 {
                print(2)
            }
            print("Finish One")
        }

        operationFirst.start()

        operationSecond.priority = .background
        operationSecond.completionBlock = {

            for _ in 0..<10 {
                print(1)
            }
            print("Finish two")
        }
        operationSecond.start()
    }

}

protocol RMOperationQueueProtocol {
    /// Тут храним пул наших операций
    var operations: [RMOperation] { get }
    /// Добавляем наши кастомные операции в пул operations
    func addOperation(_ operation: RMOperation)
    /// Запускаем следующую
    func executeNextOperation()
}

// Класс, управляющий очередью операций
final class RMOperationQueue: RMOperationQueueProtocol {
    var operations: [RMOperation] = []

    func addOperation(_ operation: RMOperation) {
        operations.append(operation)
        executeNextOperation()
    }

    func executeNextOperation() {
        if let nextOperation = operations.first(where: { !$0.isExecuting && !$0.isFinished }) {
            nextOperation.start()
            /// Тут рекурсивно запускаем следующую операцию (что такое рекурсия?)
            executeNextOperation()
        }
    }
}
