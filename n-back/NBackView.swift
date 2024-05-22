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
    @State var queue: [QueueItem] = [QueueItem(value: 1)]
    @State var streak: Int = 0;  // Number correct in a row
    @State var gameOver: Bool = false

    var body: some View {
        GeometryReader { geometry in
            VStack {
                QueueView(queue: $queue, n: $n)
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.3)
                Spacer()
                NumberPadView(selection: $selection)
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.6)
                    .onChange(of: selection.id) { _ in
                        handleSelectionChange(selection: selection, queue: queue)
                    }
                
                if gameOver {
                    NavigationLink(
                        destination: GameOverView(streak: $streak),
                        isActive: $gameOver,
                        label: {Text("For some reason this invisible label is a necessity.")}
                        )
                    .hidden()
                }
            }
        }
    }
    
    private func handleSelectionChange(selection: IdentifiableInt, queue: [QueueItem]) {
        if selection.value != queue[0].value {
            gameOver = true
        }
        
        streak += 1
        
        QueueView(queue: $queue, n: $n).updateQueue()
    }
}

