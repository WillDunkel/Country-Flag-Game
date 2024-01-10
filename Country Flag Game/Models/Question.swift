//
//  Question.swift
//  Country Flag Game
//
//  Created by William Dunkel on 1/10/24.
//

import Foundation

struct Answer: Identifiable {
    var id = UUID()
    var text: String
    var isCorrect: Bool
}

struct Question: Identifiable {
    var id = UUID()
    var correctAnswer: Answer
    var incorrectAnsers: [Answer]
}

