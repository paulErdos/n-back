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
    @State var selection: IdentifiableInt = IdentifiableInt(value: 0)
   // @State var entered_entry: String = "bar"
    @State var queue: [QueueItem] = [QueueItem(value: 1)]//, 2, 3, 4, 5]
    //@State private var queueView = QueueView(queue: $queue) // No parentheses here

    var body: some View {
        GeometryReader { geometry in
            VStack {
                QueueView(queue: $queue)
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.3)
                Spacer()
                NumberPadView(selection: $selection)//, entered_entry: $entered_entry)
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.7)
                    .onChange(of: selection.id) { _ in
                        print("change detected \(selection.value)")
                        QueueView(queue: $queue).updateQueue()//newElement: newValue)
                    }
                     /*
                    .onTapGesture {// newValue in
                        //print("change detected \(newValue)")
                        QueueView(queue: $queue).updateQueue()
                        /*
                        print("Tapped")
                        queue.append(Int.random(in: 1...100))
                        if queue.count > 5 {
                            queue.removeFirst()
                        }
                         */
                      
                    }
                      */
            }
        }
    }
}
