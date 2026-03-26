//
//  MyCardScreen.swift
//  WTFRU
//
//  Created by Sunghyun Kim on 3/23/26.
//

import SwiftUI
import SwiftData

struct MyCardScreen: View {
    @State private var isFirst: Bool = false
    @State private var isEditing: Bool = false
    @Environment(\.modelContext) private var modelContext
    
    @Query(filter: #Predicate<Namecard> { $0.isMine == true })
    private var myCards: [Namecard]

    @Query(filter: #Predicate<Namecard> { $0.isMine == false })
    private var receivedCards: [Namecard]
    
    var body: some View {
        VStack {
            HStack {
                Text("My namecard")
                    .font(.system(size: 36, weight: .bold))
                Spacer()
            }
            Spacer()
            Group {
                switch (isFirst, isEditing) {
                case (true, false):
                    CardNew()
                case (false, _):
                    Card(isEditing: $isEditing)
                case (_, _):
                    Text("Something went wrong!")
                }
            }
            Spacer()
            
            RoundedButton(text: "Create", action: {})
                .padding(20)
        }
        .background(.indigo.opacity(0.15))
        .padding(.horizontal, 15)
        
    }
}

#Preview {
    MyCardScreen()
}
