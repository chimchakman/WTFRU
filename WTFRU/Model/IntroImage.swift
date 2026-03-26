//
//  IntroImage.swift
//  WTFRU
//
//  Created by Sunghyun Kim on 3/26/26.
//

import SwiftUI
import SwiftData

@Model
class IntroImage {
    var title: String?
    var body: String?
    var image: Data
    init(title: String? = nil, body: String? = nil, image: Data) {
        self.title = title
        self.body = body
        self.image = image
    }
}
