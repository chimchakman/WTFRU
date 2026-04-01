//
//  MyCardScreen.swift
//  WTFRU
//
//  Created by Sunghyun Kim on 3/23/26.
//

import SwiftUI
import SwiftData

struct MyCardScreen: View {
    @State private var isFirst: Bool = true // true로 시작
    @State private var isEditing: Bool = false // false로 시작
    @State var isNecessaryFieldFilled: Bool = false
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
            .padding(.bottom, 20)
            Spacer()
            Group {
                switch (isFirst, isEditing) {
                case (true, false):
                    CardCreateView(isEditing: $isEditing)
                case (_, true):
                    CardSettingsView(isEditing: $isEditing)
                case (false, false):
                    CardView(isEditing: $isEditing)
                    
                }
                
            }
            
        }
        .background(.indigo.opacity(0.15))
        .padding(.horizontal, 15)
        
    }
}


#Preview {
    MyCardScreen()
}
