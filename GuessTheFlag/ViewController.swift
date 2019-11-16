//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Marc Jacques on 11/15/19.
//  Copyright © 2019 Marc Jacques. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor(red: 1.0, green: 0.6, blue: 0.2, alpha: 1.0).cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()//randomized the order of the values in the array
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "Score: \(score) Guess: \(countries[correctAnswer].uppercased())"
        count += 1
        print(count)
    }
    
    func newGame(action: UIAlertAction) {
        score = 0
        count = 0
        print("reset")
        askQuestion()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong! The correct choice was flag \(correctAnswer + 1)."
            if score == 0 {
                score = 0
            } else {
            score -= 1
            }
        }
        
        if count < 10 {
            let alert = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            
            present(alert, animated: true)
        } else if count >= 10 {
            let finalAlert = UIAlertController(title: "Game Over", message: "Your Final Score is \(score)", preferredStyle: .alert)
            
            finalAlert.addAction(UIAlertAction(title: "Reset Game", style: .default, handler: newGame))
            
            present(finalAlert, animated: true)
        }
    }
}

