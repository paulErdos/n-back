//
//  n_backApp.swift
//  n-back WatchKit Extension
//
//  Created by Vincent Steffens on 12/6/23.
//

import SwiftUI
@main
struct n_backApp: App {
    @State private var n: Int = 1
    
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
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

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
