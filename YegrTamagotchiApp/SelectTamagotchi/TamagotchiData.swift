//
//  TamagotchiData.swift
//  YegrTamagotchiApp
//
//  Created by YJ on 6/8/24.
//

import UIKit

enum TamagotchiType: String {
    case cactus = "1-6"
    case sun = "2-6"
    case star = "3-6"
    case preparing = "noImage"
}

struct SelectTamagotchi {
    let name: TamagotchiType
    let image: TamagotchiType.RawValue
}

struct TamagotchiDetail {
    let info: SelectTamagotchi
    let introduction: String
}

struct RaisingTamagotchi {
    let story: String
    let info: SelectTamagotchi
    let level: Int
    let riceCount: Int
    let waterDropCount: Int
}

struct UserInfo {
    let userNickname: String
}

struct TamagotchiData {
    static let selecttamagotchi: [SelectTamagotchi] = [
        SelectTamagotchi(name: .cactus, image: TamagotchiType.cactus.rawValue),
        SelectTamagotchi(name: .sun, image: TamagotchiType.sun.rawValue),
        SelectTamagotchi(name: .star, image: TamagotchiType.star.rawValue),
        SelectTamagotchi(name: .preparing, image: TamagotchiType.preparing.rawValue),
        SelectTamagotchi(name: .preparing, image: TamagotchiType.preparing.rawValue),
        SelectTamagotchi(name: .preparing, image: TamagotchiType.preparing.rawValue),
        SelectTamagotchi(name: .preparing, image: TamagotchiType.preparing.rawValue),
        SelectTamagotchi(name: .preparing, image: TamagotchiType.preparing.rawValue),
        SelectTamagotchi(name: .preparing, image: TamagotchiType.preparing.rawValue),
        SelectTamagotchi(name: .preparing, image: TamagotchiType.preparing.rawValue),
        SelectTamagotchi(name: .preparing, image: TamagotchiType.preparing.rawValue),
        SelectTamagotchi(name: .preparing, image: TamagotchiType.preparing.rawValue),
        SelectTamagotchi(name: .preparing, image: TamagotchiType.preparing.rawValue),
        SelectTamagotchi(name: .preparing, image: TamagotchiType.preparing.rawValue),
        SelectTamagotchi(name: .preparing, image: TamagotchiType.preparing.rawValue),
        SelectTamagotchi(name: .preparing, image: TamagotchiType.preparing.rawValue),
        SelectTamagotchi(name: .preparing, image: TamagotchiType.preparing.rawValue),
        SelectTamagotchi(name: .preparing, image: TamagotchiType.preparing.rawValue),
        SelectTamagotchi(name: .preparing, image: TamagotchiType.preparing.rawValue),
        SelectTamagotchi(name: .preparing, image: TamagotchiType.preparing.rawValue)
    ]
}
