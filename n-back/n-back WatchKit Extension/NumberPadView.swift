import SwiftUI

struct NumberPadView: View {
    @Binding var text: String
    @Binding var entered_entry: String
    
    let rows = [
        ["1", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"],
        [".", "0", "⌫"]
    ]
    
    var body: some View {
        GeometryReader { geometry in
            let height = (geometry.size.height - 2 * CGFloat(self.rows.count + 1)) / ( CGFloat(self.rows.count) + 2)
            let width = geometry.size.width / 3
            
            VStack(spacing: 0) {
                ForEach(rows, id: \.self) { row in
                    HStack(spacing: 0) {
                        ForEach(row, id: \.self) { buttonTitle in
                            Button(action: {
                                self.buttonTapped(buttonTitle)
                            }) {
                                Text(buttonTitle)
                                    .font(.title3)
                                    .frame(height: height)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(5)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color.black, lineWidth: 1)
                                    )
                            }
                            .frame(width: width, height: height) // Apply the frame to the Button view
                        }
                    }
                }
                
                Button(action: {
                    self.enterTapped()
                }) {
                    Text("Enter")
                        .font(.title)
                        .frame(width: width, height: height)
                        .background(Color.blue)
                        .cornerRadius(4)
                        .foregroundColor(.white)
                }
                .frame(width: geometry.size.width, height: height)
            }
            .padding()
        }
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

struct NumberPadadContentView: View {
    @State var text: String = ""
    @State var entered_entry: String = ""
    
    var body: some View {
        VStack {
            NumberPadView(text: $text, entered_entry: $entered_entry)
        }
    }
}
