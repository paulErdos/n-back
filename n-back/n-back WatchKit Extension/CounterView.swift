//
//  CounterView.swift
//  n-back WatchKit Extension
//
//  Created by Vincent Steffens on 12/6/23.
//

import Foundation

import SwiftUI
import WatchKit

struct CounterView: View {
    @Binding var n: Int

    var body: some View {
        VStack {
            Text("Set N")
                .padding()
            
            HStack {
                Button(action: {
                    if self.n > 1 {
                        self.n -= 1
                    }
                }) {
                    Text("-")
                        .padding()
                        .frame(width: 50)
                        .foregroundColor(self.n > 1 ? .black : .gray)
                }
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))

                Text("\(n)")
                    .padding()
                    .frame(width: 50)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.black))

                Button(action: {
                    if self.n < 6 {
                        self.n += 1
                    }
                }) {
                    Text("+")
                        .padding()
                        .frame(width: 50)
                        .foregroundColor(self.n < 100 ? .black : .gray)
                }
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
            }
        }
    }
}

struct CounterView_Previews: PreviewProvider {
    @State static var previewN: Int = 1
    
    static var previews: some View {
        CounterView(n: $previewN)
    }
}
