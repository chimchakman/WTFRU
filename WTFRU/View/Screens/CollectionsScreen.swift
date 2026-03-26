//
//  CollectionsScreen.swift
//  WTFRU
//
//  Created by Sunghyun Kim on 3/23/26.
//

import SwiftUI
import SwiftData

struct CollectionsScreen: View {
    let colors: [Color] = [.red, .blue, .yellow, .green, .purple, .orange]
    var body: some View {
        VStack {
            HStack {
                Text("Collections")
                    .font(.system(size: 36, weight: .bold))
                Spacer()
            }
            Spacer()
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                    ForEach(colors, id: \.self) { color in
                        color.frame(maxWidth: .infinity)
                            .frame(height: 300)
                    }
                }
            }
        }
        .background(.pink.opacity(0.15))
        .padding(.horizontal, 15)
    }
}

#Preview {
    CollectionsScreen()
}
