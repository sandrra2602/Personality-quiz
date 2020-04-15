//
//  QuestionBrain.swift
//  MyTestApp
//
//  Created by Sandra Kocic on 03.04.20.
//  Copyright © 2020 Sandra Kocic. All rights reserved.
//

import Foundation

struct QuestionBrain {
    
    var questionNumber = 0
    var score = 0
    var index = 0
    var answerIndex = 0
    
     let questions = [
        Question(t:"Favorite ice cream flavour?", a:["Vanilla", "Tutti Frutti", "Strawberry", "Coffee"], p:[0, 1, 2, 3]),
        Question(t:"Favorite actor?", a:["Chris Hemsworth", "Tom Hardy", "Brad Pitt", "Johnny Depp"], p:[2, 0, 3, 1]),
        Question(t:"Favorite season?", a:["Summer", "Winter", "Spring", "Autumn"], p:[3, 2, 1, 0]),
        Question(t:"Favorite sport?", a:["Football", "Handball", "Tennis", "Hockey"], p:[3, 0, 2, 1]),
        Question(t:"Favorite color?", a:["Blue", "Pink", "Yellow", "Orange"], p:[2, 3, 1, 0]),
        Question(t:"Favorite snack?", a:["Fruit", "Cookies", "Chips", "Yoghurt"], p:[2, 0, 1, 3]),
        Question(t:"Favorite time of day?", a:["Early morning", "Late night", "Afternoon", "Evening"], p:[2, 3, 1, 0]),
    ]
    
    mutating func countScore(usersAnswer: String) {
        for question in questions {
            for index in 0 ... question.answers.count - 1 {
                if question.answers[index] == usersAnswer {
                    score = score + question.points[index]
                }
            }
        }
        print(score)
    }
    
    func getScore() -> Int {
        return score
    }
    
    mutating func nextQuestion() {
        if questionNumber < questions.count - 1 {
            questionNumber += 1
        } else {
            questionNumber = 0
            score = 0
        }
    }
    
    func getQuestionNumber() -> Int {
        return questionNumber
    }
    
    func getNextQuestion() -> String{
        return questions[questionNumber].text
    }
    
    func getFirstAnswer() -> String{
        return questions[questionNumber].answers[0]
    }
    
    func getSecondAnswer() -> String{
        return questions[questionNumber].answers[1]
    }
    
    func getThirdAnswer() -> String{
        return questions[questionNumber].answers[2]
    }
    
    func getForthAnswer() -> String{
        return questions[questionNumber].answers[3]
    }
}
