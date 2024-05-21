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
    
    let rows = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9],
    ]
    
    var body: some View {
        VStack(spacing: 5) {
            ForEach(rows, id: \.self) { row in
                HStack(spacing: 1) {
                    ForEach(row, id: \.self) { buttonTitle in
                        Button(action: {
                            selection = IdentifiableInt(value: buttonTitle)
                        }) {
                            Text(String(buttonTitle))
                                .frame(width: 40, height: 40)
                                .font(.title3)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                        }
                        .frame(width: 40, height: 40)
                    }
                }
            }
        }
    }
}

