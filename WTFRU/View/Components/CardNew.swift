//
//  CardNew.swift
//  WTFRU
//
//  Created by Sunghyun Kim on 3/23/26.
//

import SwiftUI

struct CardNew: View {
    var body: some View {
        VStack {
            Text("Create\n  Your\n    New Card!")
                .font(.system(size: 24, design: .monospaced))
        }
        .frame(width: 300, height: 550)
        .background(.yellow.opacity(0.3))
    }
}

#Preview {
    CardNew()
}
