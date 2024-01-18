//
//  ContentView.swift
//  Country Flag Game
//
//  Created by William Dunkel on 1/10/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var gameManager = GameManager()
    var body: some View {
        NavigationView {
            VStack(spacing: 40, content: {
                VStack(spacing: 20, content: {
                    Text ("Country Flag Game")
                        .font (.title)
                        .fontWeight (.heavy)
                        .foregroundColor(.yellow)
                    Text ("Ready to test your skillz?")
                        .foregroundColor(.yellow)
                })
                NavigationLink {
                    QuestionView()
                        .environmentObject(gameManager)
                } label: {
                    CustomButton(text: "Start")
                }
            })
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea(.all)
            .background(.cyan)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


