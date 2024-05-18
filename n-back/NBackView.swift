//
//  NBackView.swift
//  n-back WatchKit Extension
//
//  Created by Vincent Steffens on 12/6/23.
//

import Foundation
import SwiftUI

struct NBackView: View {
    @Binding var n: Int
    @State var text: String = "foo"
    @State var entered_entry: String = "bar"
    @State private var queueView = QueueView() // No parentheses here
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                queueView
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.3)
                Spacer()
                NumberPadView(text: $text, entered_entry: $entered_entry)
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.7)
                    .onTapGesture {
                        queueView.updateQueue(newElement: Int.random(in: 1...100))
                    }
            }
        }
    }
}
