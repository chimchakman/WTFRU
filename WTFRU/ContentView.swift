//
//  ContentView.swift
//  WTFRU
//
//  Created by Sunghyun Kim on 3/23/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabView {
                MyCardScreen()
                    .tabItem {
                        Label("My Card", systemImage: "person.fill")
                    }
                
                CollectionsScreen()
                    .tabItem {
                        Label("Collections", systemImage: "square.stack")
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
