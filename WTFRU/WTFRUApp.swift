//
//  WTFRUApp.swift
//  WTFRU
//
//  Created by Sunghyun Kim on 3/23/26.
//

import SwiftUI
import SwiftData

@main
struct WTFRUApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Namecard.self, IntroImage.self])
    }
}
