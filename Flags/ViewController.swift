//
//  ViewController.swift
//  Flags
//
//  Created by Juliano Santos on 24/5/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var placalLb: UILabel!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var numberLoops = 0
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
        
        countries.shuffle()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }

    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()

        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)

        correctAnswer = Int.random(in: 0...2)
        title = countries[correctAnswer].uppercased()

        showPlacar()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String

        if sender.tag == correctAnswer {
            title = "Acerto!"
            score += 1
        } else {
            title = "Errou!"
            if score > 0 {
                score -= 1
            }
        }
        
        numberLoops += 1
        
        showPlacar()

        showMessage()
    }
    
    func showPlacar() {
        placalLb.text = "Placar: \(score) pontos. \(numberLoops) de 10 "
    }
    
    func showMessage() {
        let ac: UIAlertController
        if numberLoops == 10 {
            ac = UIAlertController( title: title, message: "Sua pontuação final é \(score) pontos", preferredStyle: .alert)
            numberLoops = 0
            score = 0
        } else {
            ac = UIAlertController(title: title, message: "Sua pontuação é: \(score).", preferredStyle: .alert)
        }
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
    
}

