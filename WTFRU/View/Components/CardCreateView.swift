//
//  CardCreateView.swift
//  WTFRU
//
//  Created by Sunghyun Kim on 3/30/26.
//

import SwiftUI

struct CardCreateView: View {
    @Binding var isEditing: Bool
    var body: some View {
        VStack {
            CardNew()
            Spacer()
            RoundedButton(text: "Create") {
                isEditing = true
            }
            .padding(20)
        }
    }
}
