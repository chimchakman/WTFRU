//
//  CardSettingsView.swift
//  WTFRU
//
//  Created by Sunghyun Kim on 3/30/26.
//

import SwiftUI
import SwiftData

struct CardSettingsView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(filter: #Predicate<Namecard> { $0.isMine == true })
    private var myCards: [Namecard]
    @Binding var isFirst: Bool
    @Binding var isEditing: Bool
    @State var isNecessaryFieldFilled: Bool = false
    @State var myNamecardDraft = NamecardDraft(isMine: true, name: "")
    
    
    var body: some View {
        VStack {
            CardSettingsFront(
                draft: $myNamecardDraft,
                isNecessaryFieldFilled: $isNecessaryFieldFilled
            )
            Spacer()
            RoundedButton(text: "Save", action: {save()}, isEnabled: isNecessaryFieldFilled)
                .padding(20)
        }
        .onAppear {
            if let existing = myCards.first {
                myNamecardDraft = NamecardDraft(
                    isMine: existing.isMine,
                    name: existing.name,
                    profileImage: existing.profileImage,
                    badges: existing.badges,
                    introText: existing.introText,
                    introImages: existing.introImages
                )
            }
        }
    }
    
    func save() -> Void {
        do {
            if let myCard = myCards.first {
                myNamecardDraft.apply(to: myCard)
            } else {
                let newCard = myNamecardDraft.makeModel()
                modelContext.insert(newCard)
            }
            try modelContext.save()
            isEditing = false
            isFirst = false
        } catch {
            print("저장 실패.")
        }
        
    }
}
