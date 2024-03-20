//
//  SecondViewController.swift
//  Multithreading
//
//  Created by Vakil on 18.03.2024.
//

import UIKit

class SecondViewController: UIViewController {
    
let thread = TheardprintDemon()
    let infinityThread = InfinityLoop()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { timer in print(Date())}
        //        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in sleep(1)}
        //        Thread.detachNewThread {
        //            for _ in (0..<10) { print("😂")
        //            }
        //        }
        //        for _ in (0..<10) { print("😈")
        //        }
        
//        
//        let theard = Thread {
//            for _ in (0..<10) { print("😂")
//            }
//        }
//        theard.start()
//        for _ in (0..<10) { print("😈")
//        }
        
//        thread.start()
//        for _ in (0..<10) { print("😂")}
        
        infinityThread.start()
        sleep(2)
        infinityThread.cancel()
    }
}

class TheardprintDemon: Thread {
    override func main() {
        for _ in (0..<10) { print("😈")
        }
    }
}

class InfinityLoop: Thread {
    override func main() {
        while !isCancelled{
            print("😂")
        }
    }
}
