//
//  CardSettings.swift
//  WTFRU
//
//  Created by Sunghyun Kim on 3/30/26.
//

import SwiftUI

struct CardSettings: View {
    @Binding var isEditing: Bool
    @Binding var isNecessaryFieldFilled: Bool
    @Binding var draft: NamecardDraft
    @State var isFlipped: Bool = false
    var body: some View {
        VStack {
            Button {
                isFlipped.toggle()
            } label: {
                Group {
                    if isFlipped {
                        CardSettingsBack(isEditing: isEditing)
                    } else {
                        CardSettingsFront(draft: $draft, isNecessaryFieldFilled: $isNecessaryFieldFilled)
                    }
                }
            }
            .buttonStyle(.plain)
        }
    }
}
