//
//  TaskThreePointTwoViewController.swift
//  Multithreading
//
//  Created by Vakil on 21.03.2024.
//

import UIKit

class TaskThreePointTwoViewController: UIViewController {
    
    let queue = DispatchQueue(label: "Vaka",attributes: .concurrent)
    let group = DispatchGroup()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let asyncWorker = AsyncWorker()
        for _ in 0...5 {
            group.enter()
           // queue.async(group: group) {
                asyncWorker.doJobs(postNumbers: 1, 2, 3, 4, 5) { posts in
                    print(Thread.current)
                    print(posts.map { $0.id })
              //  }
            }
        }
        group.leave()
        group.notify(queue: .main) {
            print("finish")
            print(asyncWorker.posts)
        }
    }
    
    class AsyncWorker {
        var posts = [Post]()
        func doJobs(postNumbers: Int..., completion: @escaping ([Post]) -> Void) {
            
            for i in postNumbers {
                URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/todos/\(i)")!)) { data, response, error in
                    guard let data = data else {
                        return
                    }
                    if let post = try? JSONDecoder().decode(Post.self, from: data) {
                        DispatchQueue.main.async {
                            self.posts.append(post)
                        }
                    }
                }
                .resume()
            }
            
            completion(posts)
        }
    }
    
    struct Post: Codable {
        var userId: Int
        var id: Int
        var title: String
        var completed: Bool
    }
}
