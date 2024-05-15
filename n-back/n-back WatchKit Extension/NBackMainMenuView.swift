//
//  NBackMainMenuView.swift
//  n-back WatchKit Extension
//
//  Created by Vincent Steffens on 12/6/23.
//

import SwiftUI
import WatchKit

struct NBackMainMenuView: View {
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

struct NBackMainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        NBackMainMenuView()
    }
}
