//
//  GameOverView.swift
//  n-back WatchKit Extension
//
//  Created by Vincent Steffens on 5/21/24.
//

import Foundation
import SwiftUI

struct GameOverView: View {
    @Binding var streak: Int
    
    var body: some View {
        Text("Score:")
        Text("\(streak)")
        NavigationLink(
            destination: MainMenuView(),
            label: {Text("Return to Main Menu")}
        )
    }
}
