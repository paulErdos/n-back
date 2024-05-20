//
//  NumberPadView.swift
//  n-back WatchKit Extension
//
//  Created by Vincent Steffens on 12/26/23.
//

import Foundation
import SwiftUI

struct IdentifiableInt: Identifiable {
    let id = UUID()
    let value: Int
}

struct NumberPadView: View {
    @Binding var selection: IdentifiableInt
    //@Binding var entered_entry: String
    
    let rows = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9],
        //[".", "0", "⌫"],
        //[".", "0", "⌫"]
    ]
    
    var body: some View {
        VStack(spacing: 5) {
            ForEach(rows, id: \.self) { row in
                HStack(spacing: 1) {
                    ForEach(row, id: \.self) { buttonTitle in
                        Button(action: {
                            selection = IdentifiableInt(value: buttonTitle)
                            //self.buttonTapped(buttonTitle)
                        }) {
                            Text(String(buttonTitle))
                                .frame(width: 40, height: 40)
                                .font(.title3)
                                //.frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                        }
                        .frame(width: 40, height: 40)
                    }
                }
            }
        }
    }
    /*
    // Next: update buttonTapped
    private func buttonTapped(_ theSelection: Int) {
        print("ButtonTapped \(theSelection)")
        selection = IdentifiableInt(value: theSelection)
        /*
        //if title == "⌫" {
        //    text = String(text.dropLast())
        //} else {
        selection = 0
        selection = theSelection
            //text += title
       // }
         */
    }
     */
    /*
    private func enterTapped() {
        entered_entry = text
        text = ""
    }
     */
}
/*
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
*/
