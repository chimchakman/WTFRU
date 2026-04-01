//
//  CardFront.swift
//  WTFRU
//
//  Created by Sunghyun Kim on 3/23/26.
//

import SwiftUI
import SwiftData
import PhotosUI

struct CardFront: View {
    @Environment(\.modelContext) private var modelContext
    
    @Query(filter: #Predicate<Namecard> { $0.isMine == true })
    private var myCards: [Namecard]
    
    @State private var selectedItems: [PhotosPickerItem] = []
    @State private var images: [UIImage] = []
    
    private var remainingCount: Int { 3 - images.count }
    
    var body: some View {
        VStack (spacing: 15){
            HStack {
                Group {
                    if let profileData = myCards.first?.profileImage,
                       let uiImage = UIImage(data: profileData) {
                        Image(uiImage: uiImage)
                    } else {
                        Color.indigo.opacity(0.25)
                    }
                    
                }
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
            .frame(height: 30)
            HStack {
                Group {
                        let images = myCards.first?.introImages ?? []
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
        .cornerRadius(20)
    }
    
    private func saveImage(from photo: PhotosPickerItem) async {
        do {
            if let data = try await photo.loadTransferable(type: Data.self) {
                myCards.first?.profileImage = data
                print("이미지 저장 성공")
            }
        } catch {
            print("이미지 저장 실패")
        }
    }
}

struct CardFrontEdit: View {
    var body: some View {
        Text("Hello, World!")
    }
}


#Preview {
    CardFront()
}
