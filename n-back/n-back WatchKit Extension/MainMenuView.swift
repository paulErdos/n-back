//
//  MainMenuView.swift
//  n-back WatchKit Extension
//
//  Created by Vincent Steffens on 5/20/24.
//

import Foundation
import SwiftUI

struct MainMenuView: View {
    @State private var n: Int = 1
    
    var body: some View {
        VStack {
            NavigationLink(destination: CounterView(n: $n)) {
                Text("Set N")
                    .padding()
                    .foregroundColor(.white)
            }
            
            NavigationLink(destination: NBackView(n: $n)) {
                Text("Start")
                    .padding()
                    .foregroundColor(.white)
            }
        }
    }
}
