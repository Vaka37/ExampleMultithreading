//
//  TaskFivePointThreeViewController.swift
//  Multithreading
//
//  Created by Vakil on 24.03.2024.
//

import UIKit

class TaskFivePointThreeViewController: UIViewController {
    var networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task{
           await fetchMessages()
        }
    }
    func fetchMessagesResult(completion: @escaping ([Message]) -> Void) {
        networkService.fetchMessages { message in
            completion(message)
        }
    }
    //Task2
    func fetchMessages() async -> [Message] {
        return await withCheckedContinuation { result in
            networkService.fetchMessages { messages in
                result.resume(returning: messages)
                print(messages)
            }
        }
    }
    //Task 3
    func fetchMessagesTwo() async throws -> [Message] {
        try await withCheckedThrowingContinuation { result in
            networkService.fetchMessages(completion: {message in
                if message.isEmpty {
                    result.resume(throwing: Error.self as! Error)
                } else {
                    result.resume(returning: message)
                }
            })
        }
    }
}

struct Message: Decodable, Identifiable {
    let id: Int
    let from: String
    let message: String
}


class NetworkService {
    
    func fetchMessages(completion: @escaping ([Message]) -> Void) {
        let url = URL(string: "https://hws.dev/user-messages.json")!

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let messages = try? JSONDecoder().decode([Message].self, from: data) {
                    completion(messages)
                    return
                }
            }

            completion([])
        }
        .resume()
    }
}
