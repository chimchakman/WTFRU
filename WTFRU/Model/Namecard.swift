//
//  Namecard.swift
//  WTFRU
//
//  Created by Sunghyun Kim on 3/25/26.
//

import SwiftUI
import SwiftData

@Model
class Namecard {
    var isMine: Bool
    var name: String
    var profileImage: Data?
    var badges: [BadgeTypes]
    var introText: String?
    var introImages: [IntroImage]
    init(isMine: Bool = false, name: String, profileImage: Data? = nil, badges: [BadgeTypes], introText: String? = nil, introImages: [IntroImage]) {
        self.isMine = isMine
        self.name = name
        self.profileImage = profileImage
        self.badges = badges
        self.introText = introText
        self.introImages = introImages
    }
}


