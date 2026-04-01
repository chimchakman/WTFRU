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
            CardFront()
            Spacer()
            HStack {
                RoundedButton(text: "Edit", action: { isEditing.toggle() })
                    .padding(20)
                RoundedButton(text: "Share", action: {})
                    .padding(20)
            }
        }
    }
}
