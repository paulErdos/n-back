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
    
    var body: some View {
        Text("\(n)")
        NumberPadView(text: $text, entered_entry: $entered_entry)
            .padding() // Add padding to the NumberPadView
            .frame(maxWidth: .infinity, alignment: .center)
    }
}
