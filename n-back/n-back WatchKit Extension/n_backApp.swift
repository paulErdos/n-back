//
//  n_backApp.swift
//  n-back WatchKit Extension
//
//  Created by Vincent Steffens on 12/6/23.
//

import SwiftUI

@main
struct n_backApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                NBackMainMenuView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
