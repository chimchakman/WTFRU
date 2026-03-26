//
//  Card.swift
//  WTFRU
//
//  Created by Sunghyun Kim on 3/23/26.
//

import SwiftUI

struct Card: View {
    @Binding var isEditing: Bool
    @State var isFlipped: Bool = false
    var body: some View {
        Button {
            isFlipped.toggle()
        } label: {
            Group {
                if isFlipped {
                    CardBack(isEditing: isEditing)
                } else {
                    CardFront(isEditing: isEditing)
                }
            }
        }
        .buttonStyle(.plain)
    }
}
