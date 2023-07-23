//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Prasshant Shanmugalingam on 23/07/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    let quiz = Question.quiz
    var questionNumber: Int = 0
    var score: Int = 0
    
    mutating func checkAnswer (condition: Bool) -> Bool {
        let quizLength:Int = quiz.count - 1
        guard questionNumber < quizLength else { // use quiz.count here
            return checkAndReset(condition) // call a helper function here
       }
        return checkAndIncrement(condition) // call another helper function here
     }
    
    // a helper function to check the answer and reset the question number
    mutating func checkAndReset(_ condition: Bool) -> Bool {
        switch quiz[questionNumber].a {
        case condition:
            questionNumber = 0
            score += 1
            return true
        default:
            questionNumber = 0
            return false
        }
    }
    
    // a helper function to check the answer and increment the question number
    mutating func checkAndIncrement(_ condition: Bool) -> Bool {
        switch quiz[questionNumber].a {
        case condition:
            questionNumber += 1
            score += 1
            return true
        default:
            questionNumber += 1
            return false
        }
    }
    
    func getProgress() -> Float {
        let progress: Float = Float(questionNumber + 1) / Float(quiz.count)
        return progress
    }
    
    func getQuestionText() -> String {
        return quiz[questionNumber].q
    }
    
    mutating func getScore() -> Int {
        if questionNumber == 0 {
            score = 0
        }
        return score
    }
    
}
