//
//  CardSettingsBack.swift
//  WTFRU
//
//  Created by Sunghyun Kim on 3/30/26.
//

import SwiftUI

struct CardSettingsBack: View {
    var isEditing: Bool
    var body: some View {
        Text("CardSettingsBack" + (isEditing ? " (Editing)" : ""))
            .frame(width: 300, height: 550)
            .background(.pink.opacity(0.3))
    }
}
