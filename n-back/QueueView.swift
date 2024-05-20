import Foundation
import SwiftUI

struct QueueItem: Identifiable {
    let id = UUID()
    let value: Int
}

struct QueueView: View {
    @Binding var queue: [QueueItem]

    func updateQueue() {//newElement: Int) {
        let newElement = QueueItem(value: Int.random(in: 1...9))
        print("update called \(newElement)")
        if queue.count < 5 {
            queue.append(newElement)
        } else {
            queue.removeFirst()
            queue.append(newElement)
        }
    }
    
    var body: some View {
        HStack {
            ForEach(queue) { item in
                Text("\(item.value)")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
    }
}
