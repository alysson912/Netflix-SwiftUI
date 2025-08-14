//
//  NetflixApp.swift
//  Netflix
//
//  Created by ALYSSON MENEZES on 13/08/25.
//

import SwiftUI
import SwiftfulRouting

@main
struct NetflixApp: App {
    var body: some Scene {
        WindowGroup {
            RouterView { _ in
                HomeView()
            }
        }
    }
}
