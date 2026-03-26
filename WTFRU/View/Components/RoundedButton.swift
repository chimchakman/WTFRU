//
//  RoundedButton.swift
//  WTFRU
//
//  Created by Sunghyun Kim on 3/23/26.
//

import SwiftUI

struct RoundedButton: View {
    var text: String
    var action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .font(.system(size: 28, weight: .semibold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 40)
        }
        .buttonStyle(.glassProminent)
    }
    
}

#Preview {
    RoundedButton(text: "Button", action: {})
}
