//
//  NamecardDraft.swift
//  WTFRU
//
//  Created by Sunghyun Kim on 3/31/26.
//

import SwiftUI
import SwiftData

struct NamecardDraft {
    var isMine: Bool
    var name: String
    var profileImage: Data?
    var badges: [BadgeTypes]
    var introText: String?
    var introImages: [IntroImage]
    init(isMine: Bool = false, name: String, profileImage: Data? = nil, badges: [BadgeTypes] = [], introText: String? = nil, introImages: [IntroImage] = []) {
        self.isMine = isMine
        self.name = name
        self.profileImage = profileImage
        self.badges = badges
        self.introText = introText
        self.introImages = introImages
    }
    
    func makeModel() -> Namecard {
        Namecard(isMine: isMine, name: name, profileImage: profileImage, badges: badges, introText: introText, introImages: introImages)
    }
    
    func apply(to card: Namecard) {
        card.isMine = isMine
        card.name = name
        card.profileImage = profileImage
        card.badges = badges
        card.introText = introText
        card.introImages = introImages
    }
}
