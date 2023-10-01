//
//  Kadai7App.swift
//  Kadai7
//
//  Created by Hajime on 9/29/23.
//

import SwiftUI

@main
struct Kadai7App: App {
    init() {
        UITabBar.appearance().unselectedItemTintColor = .gray
        UITabBar.appearance().backgroundColor = .white
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
