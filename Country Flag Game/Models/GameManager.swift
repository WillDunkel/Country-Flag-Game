//
//  GameManager.swift
//  Country Flag Game
//
//  Created by William Dunkel on 1/17/24.
//

import Foundation
import SwiftUI

class GameManager: ObservableObject {
    var questions = [Question]()
    @Published private (set) var index = 0
    @Published private (set) var playingGame = false
    @Published private (set) var answerSelected = false
    @Published private (set) var country = ""
    @Published private (set) var answerChoices = [Answer]()
    @Published private (set) var progress: CGFloat = 0.0
    @Published private (set) var score = 0
    
    init() {
        reset()
    }
    
    func reset() {
        loadQuestions()
        questions = questions.shuffled()
        index = 0
        score = 0
        progress = 0.0
        playingGame = true
        goToNextQuestion()
    }
    
    func loadQuestions() {
        let countries = Data().countries
        if countries.count < 4 {
            print("There are only \(countries.count) countries listed in Data (must be at least 4)")
        }
        else {
            questions.removeAll()
            for country in countries {
                if UIImage (named: country) != nil {
                    var incorrectAnswer = [String]()
                    while incorrectAnswer.count < 3 {
                        if let randomCountry = countries.randomElement () {
                            if randomCountry != country && !incorrectAnswer.contains (randomCountry) {
                                incorrectAnswer.append(randomCountry)
                            }
                        }
                    }
                    questions.append(Question(correctAnswer: Answer (text: country, isCorrect: true),
                                              incorrectAnswers: [
                                                Answer(text: incorrectAnswer[0], isCorrect: false),
                                                Answer(text: incorrectAnswer[1], isCorrect: false),
                                                Answer(text: incorrectAnswer[2], isCorrect: false)
                                              ]))
                }
                else {
                    print("\(country) image cannot be found")
                }
            }
        }
    }
    
    
    func goToNextQuestion() {
        if index < questions.count {
            answerSelected = false
            progress = CGFloat (index) / CGFloat (questions.count) * 350.0
            let nextQuestion = questions[index]
            country = nextQuestion.correctAnswer.text
            answerChoices = ([nextQuestion.correctAnswer] + nextQuestion.incorrectAnswers).shuffled()
            index += 1
        }
        else {
            playingGame = false
        }
    }
    
    func selectAnswer(answer: Answer) {
        answerSelected = true
        if answer.isCorrect{
            score += 1
        }
    }
}
