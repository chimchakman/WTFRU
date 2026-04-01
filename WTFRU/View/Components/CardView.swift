//
//  CardView.swift
//  WTFRU
//
//  Created by Sunghyun Kim on 3/30/26.
//

import SwiftUI

struct CardView: View {
    @Binding var isEditing: Bool
    var body: some View {
        VStack {
            Card(isEditing: $isEditing)
            Spacer()
            RoundedButton(text: "Share", action: {})
                .padding(20)
        }
    }
}
