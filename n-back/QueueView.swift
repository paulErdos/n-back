//
//  QueueView.swift
//  n-back WatchKit Extension
//
//  Created by Vincent Steffens on 5/16/24.
//

import Foundation
import SwiftUI

struct QueueView: View {
    @State private var queue: [Int] = [1, 2, 3, 4, 5]

    mutating func updateQueue(newElement: Int) {
        if queue.count < 5 {
            queue.append(newElement)
        } else {
            queue.removeFirst()
            queue.append(newElement)
        }
    }
    
    var body: some View {
        HStack {
            ForEach(queue, id: \.self) { number in
                Text("\(number)")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
    }
}
