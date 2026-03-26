//
//  CardBack.swift
//  WTFRU
//
//  Created by Sunghyun Kim on 3/23/26.
//

import SwiftUI

struct CardBack: View {
    var isEditing: Bool
    var body: some View {
        Text("CardBack" + (isEditing ? " (Editing)" : ""))
            .frame(width: 300, height: 550)
            .background(.pink.opacity(0.3))
    }
}
