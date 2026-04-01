//
//  CardSettingsFront.swift
//  WTFRU
//
//  Created by Sunghyun Kim on 3/30/26.
//

import SwiftUI
import SwiftData
import PhotosUI

struct CardSettingsFront: View {
    @State private var selectedItems: [PhotosPickerItem] = []
    @State private var selectedIntroItems: [[PhotosPickerItem]] = [[], [], []]

    
    @State private var images: [UIImage] = []
    @State private var badgeSheetOpen: Bool = false

    @Query(filter: #Predicate<Namecard> { $0.isMine == true })
    private var myCards: [Namecard]
    
    @Binding var draft: NamecardDraft
    @Binding var isNecessaryFieldFilled: Bool
    
    var body: some View {
        VStack (spacing: 15){
            HStack {
                // 프로필 사진
                PhotosPicker (selection: $selectedItems, maxSelectionCount: 1) {
                    ZStack {
                        if let profileData = draft.profileImage,
                           let uiImage = UIImage(data: profileData) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFill()
                                .clipped()
                        } else {
                            Color.indigo.opacity(0.5)
                        }
                        Image(systemName: "photo.badge.plus")
                            .shadow(color: .white, radius: 5)
                    }
                }
                .onChange(of: selectedItems) {_, photos in
                    Task {
                        for photo in photos {
                            await saveImage(from: photo)
                        }
                        selectedItems.removeAll()
                    }
                }
                .frame(width: 120, height: 180)
                .clipped()
                .cornerRadius(10)
                
                // 이름
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        TextField("Name", text: $draft.name)
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                            .onChange(of: draft.name) { _ in
                                if !draft.name.isEmpty {
                                    isNecessaryFieldFilled = true
                                } else {
                                    isNecessaryFieldFilled = false
                                }
                            }
                            .padding(5)
                            .border(.primary.opacity(0.2), width: 1)
                        Spacer()
                    }
                }
            }
            .frame(height: 180)
            
            // 배지
            HStack {
                ForEach(draft.badges, id: \.self) { badge in
                    Text(badge.rawValue)
                }
                .font(.system(size: 16))
                Button {
                    badgeSheetOpen = true
                } label: {
                    Image(systemName: "plus.circle.dashed")
                        .resizable()
                        .scaledToFit()
                }
                Spacer()
            }
            .frame(height: 25)
            .sheet(isPresented: $badgeSheetOpen) {
                VStack {
                    HStack {
                        ForEach(BadgeTypes.allCases) { badge in
                            Button {
                                if draft.badges.contains(badge) {
                                    draft.badges.removeAll { $0 == badge }
                                } else {
                                    draft.badges.append(badge)
                                }
                            } label: {
                                Text(badge.rawValue)
                                    .font(Font.system(size: 24))
                                    .padding()
                                    .background(draft.badges.contains(badge) ? Color.blue : Color.clear)
                                    .cornerRadius(5)
                            }
                        }
                    }
                    .padding(.top, 30)
                    Spacer()
                }
                .presentationDetents([.medium])
            }
            
            // 소개 문구
            HStack {
                TextField("Introduce yourself", text: $draft.introText)
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                    .padding(5)
                    .border(.primary.opacity(0.2), width: 1)
                Spacer()
            }
            .frame(height: 30)
            
            // 소개 이미지
            HStack {
                Spacer()
                ForEach (1...3, id:\.self) { i in
                    PhotosPicker (selection: $selectedIntroItems[i-1], maxSelectionCount: 1) {
                        ZStack {
                            if let IntroData = draft.introImages.first(where: { $0.order == i })?.image,
                               let uiImage = UIImage(data: IntroData) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFill()
                                    .clipped()
                            } else {
                                Color.gray.opacity(0.5)
                            }
                            Image(systemName: "photo.badge.plus")
                                .shadow(color: .white, radius: 5)
                        }
                    }
                    .onChange(of: selectedIntroItems[i-1]) {_, photos in
                        Task {
                            for photo in photos {
                                await saveIntroImage(from: photo, order: i)
                            }
                            selectedIntroItems[i-1].removeAll()
                        }
                    }
                    .frame(width: 80, height: 100)
                    .clipped()
                    .cornerRadius(10)
                }
                Spacer()
            }
            Spacer()
        }
        .padding(20)
        .frame(width: 300, height: 550)
        .background(.indigo.opacity(0.3))
        .cornerRadius(20)
    }
    
    private func saveImage(from photo: PhotosPickerItem) async {
        do {
            if let data = try await photo.loadTransferable(type: Data.self) {
                draft.profileImage = data
                print("이미지 저장 성공")
            }
        } catch {
            print("이미지 저장 실패")
        }
    }
    
    private func saveIntroImage(from photo: PhotosPickerItem, order: Int) async {
        do {
            if let data = try await photo.loadTransferable(type: Data.self) {
                draft.introImages.removeAll(where: { $0.order == order })
                let newIntroImage = IntroImage(title: "", image: data, order: order)
                draft.introImages.append(newIntroImage)
                print("이미지 저장 성공")
            }
        } catch {
            print("이미지 저장 실패")
        }
    }
}

//#Preview {
//    
//    CardSettingsFront(draft: <#T##Binding<NamecardDraft>#>, isNecessaryFieldFilled: <#T##Binding<Bool>#>)
//}
