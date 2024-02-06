//
//  CustomButton.swift
//  Country Flag Game
//
//  Created by William Dunkel on 1/10/24.
//

import SwiftUI

struct CustomButton: View {
    var text: String
    var background:  Color = .yellow
    var body: some View {
        Text("Next")
            .foregroundColor(.cyan)
            .padding()
            .padding(.horizontal)
            .background(background)
            .cornerRadius(25)
            .shadow(radius: 10)
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(text: "Next")
    }
}
