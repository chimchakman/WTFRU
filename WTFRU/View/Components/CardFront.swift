//
//  CardFront.swift
//  WTFRU
//
//  Created by Sunghyun Kim on 3/23/26.
//

import SwiftUI

struct CardFront: View {
    var isEditing: Bool
    var body: some View {
        VStack (spacing: 15){
            HStack {
                Color.blue
                    .frame(maxWidth: .infinity)
                    .frame(width: 120, height: 180)
                    .cornerRadius(10)
                VStack {
                    HStack {
                        Spacer()
                    }
                    Spacer()
                    Text("Mulgae")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                }
            }
            .frame(height: 180)
            HStack {
                Text(BadgeTypes.coffee.rawValue)
                Text(BadgeTypes.tech.rawValue)
                Text(BadgeTypes.design.rawValue)
                Text(BadgeTypes.pm.rawValue)
                Spacer()
            }
            HStack {
                Text("한국인이면 제발 침투부 구독합시다.")
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                Spacer()
            }
            HStack {
                
            }
            Spacer()
        }
        .padding(20)
        .frame(width: 300, height: 550)
        .background(.orange.opacity(0.3))
    }
}

#Preview {
    CardFront(isEditing: false)
}
