//
//  NumberPadView.swift
//  n-back WatchKit Extension
//
//  Created by Vincent Steffens on 12/26/23.
//

import Foundation
import SwiftUI

struct NumberPadView: View {
    @Binding var text: String
    @Binding var entered_entry: String
    
    let rows = [
        ["1", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"],
        //[".", "0", "⌫"],
        //[".", "0", "⌫"]
    ]
    
    var body: some View {
        VStack(spacing: 5) {
            ForEach(rows, id: \.self) { row in
                HStack(spacing: 1) {
                    ForEach(row, id: \.self) { buttonTitle in
                        Button(action: {
                            self.buttonTapped(buttonTitle)
                        }) {
                            Text(buttonTitle)
                                .frame(width: 40, height: 40)
                                .font(.title3)
                                //.frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                        }
                        .frame(width: 40, height: 40)
                    }
                }
                //.frame(maxWidth: .infinity) // Ensure each row takes full width
            }
        }
        //.padding()
        //.frame(maxWidth: .infinity, maxHeight: .infinity) // Ensure the entire VStack takes up full space
    }
    
    private func buttonTapped(_ title: String) {
        if title == "⌫" {
            text = String(text.dropLast())
        } else {
            text += title
        }
    }
    
    private func enterTapped() {
        entered_entry = text
        text = ""
    }
}

struct NumberPadContentView: View {
    @State var text: String = ""
    @State var entered_entry: String = ""
    
    var body: some View {
        NavigationView {
            NumberPadView(text: $text, entered_entry: $entered_entry)
               // .navigationBarTitle("Number Pad", displayMode: .inline) // Optional: if you want a title
        }
    }
}
