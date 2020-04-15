//
//  Question.swift
//  MyTestApp
//
//  Created by Sandra Kocic on 03.04.20.
//  Copyright © 2020 Sandra Kocic. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answers: [String]
    let points: [Int]
    
    init(t: String, a: [String], p: [Int]) {
        text = t
        answers = a
        points = p
    }
}
