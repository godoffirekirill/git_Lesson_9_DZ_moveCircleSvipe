//
//  ViewController.swift
//  Lesson 9 DZ moveCircleSvipe
//
//  Created by Кирилл Курочкин on 26.09.2023.
//

import UIKit


enum Direction: String {
    case left = "Left"
    case right = "Right"
    case up = "Up"
    case down = "Down"
}

class ViewController: UIViewController {

    let myView = UIView()
    
    var radius: CGFloat = 100
    var x: CGFloat = 100
    var y: CGFloat = 100
    
    @IBOutlet weak var statusDirectionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(tapDetacted))
        recognizer.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(recognizer)
        
        let leftSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(leftSwipeDetected))
        leftSwipeRecognizer.direction = .left
        self.myView.addGestureRecognizer(leftSwipeRecognizer)
        let rightSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(rightSwipeDetected))
        rightSwipeRecognizer.direction = .right
        self.myView.addGestureRecognizer(rightSwipeRecognizer)
        let upSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(upSwipeDetected))
        upSwipeRecognizer.direction = .up
        self.myView.addGestureRecognizer(upSwipeRecognizer)
        let downSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(downSwipeDetected))
        downSwipeRecognizer.direction = .down
        self.myView.addGestureRecognizer(downSwipeRecognizer)
      
    }
    
    
    @IBAction func tapDetacted() {
        myView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        myView.backgroundColor = .blue
        myView.layer.cornerRadius = myView.frame.size.width/2
        self.view.addSubview(myView)
        
    }
    @IBAction func leftSwipeDetected() {
        move(direction: .left)
        
    }
    
    @IBAction func rightSwipeDetected() {
        move(direction: .right)
        
    }
    
    @IBAction func upSwipeDetected() {
        move(direction: .up)
        
    }
    @IBAction func downSwipeDetected() {
        move(direction: .down)
        
    }
    
    func move(direction: Direction) {
        switch direction {
        case .left:  if myView.frame.origin.x > 0{
            self.myView.frame.origin.x -= 50
            self.statusDirectionLabel.text = "\(direction.rawValue)"
        } else {self.statusDirectionLabel.text = "CRASH"}
        case .right: if (myView.frame.origin.x + myView.frame.size.width) < view.frame.size.width {
            self.myView.frame.origin.x += 50
            self.statusDirectionLabel.text = "\(direction.rawValue)"
        } else {self.statusDirectionLabel.text = "CRASH"}
        case .up: if myView.frame.origin.y > 0 {
            self.myView.frame.origin.y -= 50
            self.statusDirectionLabel.text = "\(direction.rawValue)"
        } else {self.statusDirectionLabel.text = "CRASH"}
        case .down: if ((myView.frame.origin.y + myView.frame.size.width) < view.frame.size.height) {
            self.myView.frame.origin.y += 50
            self.statusDirectionLabel.text = "\(direction.rawValue)"
        } else {self.statusDirectionLabel.text = "CRASH"}
        }
        print("Moving\(direction.rawValue)") //-теперь в консоль выходит значение из enum
        //self.movingLabel.text = "\(direction.rawValue)"
    }
    
    
}

