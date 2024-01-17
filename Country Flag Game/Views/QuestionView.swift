//
//  QuestionView.swift
//  Country Flag Game
//
//  Created by William Dunkel on 1/11/24.
//

import SwiftUI

struct QuestionView: View {
    var body: some View {
        VStack(spacing: 20 ){
            HStack{
                Text ("Country Flag Quiz")
                .foregroundColor (.yellow)
                .fontWeight (.heavy)
                Spacer()
                Text("1 out of 3")
                    .foregroundColor(.yellow)
            } 
            ProgressBar(progress: 50)
            VStack (spacing: 10) {
                Text ("Which country's flag is this?")
                Image ("Italy")
                    .resizable ()
                    . frame (width: 300, height: 200)
                AnswerRow(answer: Answer(text: "France", isCorrect: false))
                AnswerRow(answer: Answer(text: "Germany", isCorrect: false))
                AnswerRow(answer: Answer(text: "Italy", isCorrect: true))
                AnswerRow(answer: Answer(text: "England", isCorrect: false))
            }
            CustomButton(text: "Next")
            Spacer()
        }
        .padding()
        .background(.cyan)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
