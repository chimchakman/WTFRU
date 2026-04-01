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
    @State private var images: [UIImage] = []
    
    @Binding var draft: NamecardDraft
    @Binding var isNecessaryFieldFilled: Bool
    
    private var remainingCount: Int { 3 - images.count }
    
    var body: some View {
        VStack (spacing: 15){
            HStack {
                PhotosPicker (selection: $selectedItems, maxSelectionCount: remainingCount) {
                    ZStack {
                        Image(systemName: "photo.badge.plus")
                        if let profileData = draft.profileImage,
                           let uiImage = UIImage(data: profileData) {
                            Image(uiImage: uiImage)
                        } else {
                            Color.indigo.opacity(0.5)
                        }
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
                .frame(maxWidth: .infinity)
                .frame(width: 120, height: 180)
                .cornerRadius(10)
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        TextField("Name", text: $draft.name)
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                        Spacer()
                    }
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
            .frame(height: 30)
            HStack {
                Group {
                    let images = draft.introImages
                    ForEach(0..<3, id: \.self) { i in
                        if i < images.count {
                            Text(images[i].title ?? "")
                            let uiImage = UIImage(data: images[i].image)
                            Image(uiImage: uiImage!)
                                .scaledToFit()
                        } else {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(.gray.opacity(0.3))
                        }
                    }
                    
                }
                .frame(height: 100)
            }
            Spacer()
        }
        .padding(20)
        .frame(width: 300, height: 550)
        .background(.indigo.opacity(0.3))
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
}

//#Preview {
//    
//    CardSettingsFront(draft: <#T##Binding<NamecardDraft>#>, isNecessaryFieldFilled: <#T##Binding<Bool>#>)
//}
