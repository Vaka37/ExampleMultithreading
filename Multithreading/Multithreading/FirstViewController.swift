//
//  ViewController.swift
//  Multithreading
//
//  Created by Vakil on 18.03.2024.
//

import UIKit
/// Стартовый контроллер приложения
final class FirstViewController: UIViewController {
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        button.center.x = view.center.x
        button.center.y = view.center.y
        return button
    }()
    private lazy var isSelected = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(button)
        print(Thread.current)
        for index in 0 ... UInt.max {
            autoreleasepool{
                let string = NSString(format: "test + %d", index)
                print(string)
            }
        }
        print("End test")
    }
    @objc private func changeColor() {
        isSelected.toggle()
        view.backgroundColor = isSelected ? .blue : .red
    }
    
}

