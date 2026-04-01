//
//  Badge.swift
//  WTFRU
//
//  Created by Sunghyun Kim on 3/23/26.
//

import SwiftUI
import SwiftData

enum BadgeTypes: String, CaseIterable, Identifiable, Codable {
    case coffee = "☕️"
    case tech = "💻"
    case design = "🎨"
    case pm = "🗒️"
    
    var id: Self { self }
}
