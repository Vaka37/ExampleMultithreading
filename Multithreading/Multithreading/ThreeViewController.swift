//
//  ThreeViewController.swift
//  Multithreading
//
//  Created by Vakil on 18.03.2024.
//

import UIKit

class ThreeViewController: UIViewController {
    
    let dimonThread = ThreadPrintDemon()
    let smileThread = ThreadSmilePrint()
    let timethread = TimeThread()

    override func viewDidLoad() {
        super.viewDidLoad()
        timethread.start()
//        dimonThread.qualityOfService = .userInteractive
//        smileThread.qualityOfService = .utility
//        dimonThread.start()
//        smileThread.start()
    }
    
}

class ThreadPrintDemon: Thread {
    override func main() {
        for _ in 0..<100 {
            print("😈")
            Thread.sleep(forTimeInterval: 1)
        }
    }
}

class ThreadSmilePrint: Thread {
    override func main() {
        for _ in 0..<100 {
            print("😂")
            Thread.sleep(forTimeInterval: 1)
        }
    }
}

class TimeThread: Thread {
    override func main() {
        RunLoop.current.run()
        Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { _ in
            print("tick")
        }
        //RunLoop.current.run(until: Date() + 20)
    }
}



class ThreeViewControllers: UIViewController {
    
    let timethread = TimeThreads()

    override func viewDidLoad() {
        super.viewDidLoad()
        timethread.start()
    }
    
}


class TimeThreads: Thread {
    override func main() {
       // while !isCancelled {
        RunLoop.current.run()
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
                print("roadMap")
            }
       // }
        RunLoop.current.run(until: Date() + 10)
    }
}
