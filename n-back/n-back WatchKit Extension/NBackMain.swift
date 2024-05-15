//
//  NBackMain.swift
//  n-back WatchKit Extension
//
//  Created by Vincent Steffens on 12/26/23.
//

import Foundation
import SwiftUI

struct NBackMain: View {
    @Binding var n: Int
    @State var text: String
    @State var entered_entry: String
    
    var body: some View {
        VStack {
            Text("\(n)")
            NumberPadView(text: $text, entered_entry: $entered_entry)
        }
    }
    
}
