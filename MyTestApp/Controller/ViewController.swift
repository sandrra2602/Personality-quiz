//
//  ViewController.swift
//  MyTestApp
//
//  Created by Sandra Kocic on 03.04.20.
//  Copyright © 2020 Sandra Kocic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var questionView: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var topLeftButtonView: UIButton!
    @IBOutlet weak var topRightButtonView: UIButton!
    @IBOutlet weak var bottomLeftButtonView: UIButton!
    @IBOutlet weak var bottomRightButtonView: UIButton!
    
    var questionBrain = QuestionBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.isHidden = true
        imageView.isHidden = true
        questionView.text = questionBrain.questions[0].text
        topLeftButtonView.setTitle(questionBrain.questions[0].answers[0], for: .normal)
        topRightButtonView.setTitle(questionBrain.questions[0].answers[1], for: .normal)
        bottomLeftButtonView.setTitle(questionBrain.questions[0].answers[2], for: .normal)
        bottomRightButtonView.setTitle(questionBrain.questions[0].answers[3], for: .normal)
    }


    @IBAction func choiceMade(_ sender: UIButton) {
        let usersAnswer = sender.currentTitle!
        questionBrain.countScore(usersAnswer: usersAnswer)
        
        if questionBrain.questionNumber < questionBrain.questions.count - 1 {
            questionBrain.questionNumber += 1
            updateUI()
        } else {
            endUI()
        }
        
       }
    
    @objc func updateUI() {
        questionView.text = questionBrain.getNextQuestion()
        topLeftButtonView.setTitle(questionBrain.getFirstAnswer(), for: .normal)
        topRightButtonView.setTitle(questionBrain.getSecondAnswer(), for: .normal)
        bottomLeftButtonView.setTitle(questionBrain.getThirdAnswer(), for: .normal)
        bottomRightButtonView.setTitle(questionBrain.getForthAnswer(), for: .normal)
        
    }
    
    @objc func endUI() {
        topLeftButtonView.isHidden = true
        topRightButtonView.isHidden = true
        bottomLeftButtonView.isHidden = true
        bottomRightButtonView.isHidden = true
        topLeftButtonView.isEnabled = false
        topRightButtonView.isEnabled = false
        bottomLeftButtonView.isEnabled = false
        bottomRightButtonView.isEnabled = false
        questionView.isHidden = true
        imageView.isHidden = false
        resultLabel.isHidden = false
        resultLabel.textColor = UIColor.black
        let score = questionBrain.getScore()
        switch score {
        case 0 ... 3:
            imageView.image = UIImage(named: "adventure")
            resultLabel.text = "You are an adventurer!"
        case 4 ... 10:
            imageView.image = UIImage(named: "art")
            resultLabel.text = "You are an artist!"
        case 11 ... 17:
            imageView.image = UIImage(named: "sports")
            resultLabel.text = "You are an athlee!"
        case 18 ... 21:
            imageView.image = UIImage(named: "makeup")
            resultLabel.text = "You are a make up enthusiast!"
        default:
            print("Error")
                
        }
    }
}

