import Foundation
import SwiftUI

struct QueueView: View {
    @Binding var queue: [Int]

    func updateQueue(newElement: Int) {
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
            ForEach(queue.indices, id: \.self) { index in
                Text("\(queue[index])")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
    }
}
