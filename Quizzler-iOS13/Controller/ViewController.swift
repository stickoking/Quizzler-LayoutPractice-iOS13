//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Prasshant Shanmugalingam on 23/07/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var preogressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    var quizBrain: QuizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUi()
    }

    @IBAction func asnwerButtonPressed(_ sender: UIButton) {
        let userAnswer: Bool = sender == trueButton ? true : false
        let isAnswerCorrect = quizBrain.checkAnswer(condition: userAnswer)
        animateButtonColor(buttonPressed: sender, answer: isAnswerCorrect)
        updateUi()
    }
    
    func animateButtonColor (buttonPressed: UIButton, answer: Bool) {
        let animateColor = answer ? UIColor.green : UIColor.red
        let initialColor = UIColor.clear
        UIView.animate(withDuration: 0.5, animations: {
            buttonPressed.backgroundColor = animateColor
        }, completion: {_ in
            UIView.animate(withDuration: 0.5, animations: {
                buttonPressed.backgroundColor = initialColor
            })
        })
    }
    
    func updateUi() {
        let question: String = quizBrain.getQuestionText()
        let progress: Float = quizBrain.getProgress()
        let score : Int = quizBrain.getScore()
        questionLabel.text = question
        scoreLabel.text = "Score: \(score)"
        preogressBar.progress = progress
     }
 }



