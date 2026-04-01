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
    
    var body: some View {
        VStack (spacing: 15){
            HStack {
                Group {
                    if let profileData = myCards.first?.profileImage,
                       let uiImage = UIImage(data: profileData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .clipped()
                    } else {
                        Color.indigo.opacity(0.25)
                    }
                    
                }
                .frame(width: 120, height: 180)
                .cornerRadius(10)
                .clipped()
                VStack {
                    HStack {
                        Spacer()
                    }
                    Spacer()
                    Text(myCards.first?.name ?? "Name")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                }
            }
            .frame(height: 180)
            HStack {
                ForEach(myCards.first?.badges ?? [], id: \.self) { badge in
                    Text(badge.rawValue)
                }
                .font(.system(size: 16))
                Spacer()
            }
            .frame(height: 25)
            HStack {
                Text(myCards.first?.introText ?? "")
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                    .padding(5)
                Spacer()
            }
            .frame(height: 30)
            HStack {
                Spacer()
                ForEach(1...3, id: \.self) { i in
                    if let image = myCards.first?.introImages.first(where: {$0.order == i}),
                       let uiImage = UIImage(data: image.image) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 100)
                            .clipped()
                            .cornerRadius(10)
                    }
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
    
}
struct CardFrontEdit: View {
    var body: some View {
        Text("Hello, World!")
    }
}


#Preview {
    CardFront()
}
