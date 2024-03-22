//
//  TaskFourPointOneViewController.swift
//  Multithreading
//
//  Created by Vakil on 22.03.2024.
//

import UIKit

class TaskFourPointOneViewController: UIViewController {

    class Post: @unchecked Sendable {
            
    }

    enum State1: Sendable {
         case loading
         case data(String)
    }
        
    enum State2: Sendable {
         case loading
         case data(Post) // Out: Associated value 'data' of 'Sendable'-conforming enum 'State2' has non-sendable type 'ViewController.Post'
    }

    }

