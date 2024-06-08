//
//  TamagotchiData.swift
//  YegrTamagotchiApp
//
//  Created by YJ on 6/8/24.
//

import UIKit

enum TamagotchiName: String {
    case cactus = "따끔따끔 다마고치"
    case sun = "방실방실 다마고치"
    case star = "반짝반짝 다마고치"
    case preparing = "준비중이에요"
}

enum TamagotchiImage: String {
    case cactus = "1-6"
    case sun = "2-6"
    case star = "3-6"
    case preparing = "noImage"
}

struct SelectTamagotchi {
    let name: TamagotchiName.RawValue
    let image: TamagotchiImage.RawValue
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
        SelectTamagotchi(name: TamagotchiName.cactus.rawValue, image: TamagotchiImage.cactus.rawValue),
        SelectTamagotchi(name: TamagotchiName.sun.rawValue, image: TamagotchiImage.sun.rawValue),
        SelectTamagotchi(name: TamagotchiName.star.rawValue, image: TamagotchiImage.star.rawValue),
        SelectTamagotchi(name: TamagotchiName.preparing.rawValue, image: TamagotchiImage.preparing.rawValue),
        SelectTamagotchi(name: TamagotchiName.preparing.rawValue, image: TamagotchiImage.preparing.rawValue),
        SelectTamagotchi(name: TamagotchiName.preparing.rawValue, image: TamagotchiImage.preparing.rawValue),
        SelectTamagotchi(name: TamagotchiName.preparing.rawValue, image: TamagotchiImage.preparing.rawValue),
        SelectTamagotchi(name: TamagotchiName.preparing.rawValue, image: TamagotchiImage.preparing.rawValue),
        SelectTamagotchi(name: TamagotchiName.preparing.rawValue, image: TamagotchiImage.preparing.rawValue),
        SelectTamagotchi(name: TamagotchiName.preparing.rawValue, image: TamagotchiImage.preparing.rawValue),
        SelectTamagotchi(name: TamagotchiName.preparing.rawValue, image: TamagotchiImage.preparing.rawValue),
        SelectTamagotchi(name: TamagotchiName.preparing.rawValue, image: TamagotchiImage.preparing.rawValue),
        SelectTamagotchi(name: TamagotchiName.preparing.rawValue, image: TamagotchiImage.preparing.rawValue),
        SelectTamagotchi(name: TamagotchiName.preparing.rawValue, image: TamagotchiImage.preparing.rawValue),
        SelectTamagotchi(name: TamagotchiName.preparing.rawValue, image: TamagotchiImage.preparing.rawValue),
        SelectTamagotchi(name: TamagotchiName.preparing.rawValue, image: TamagotchiImage.preparing.rawValue),
        SelectTamagotchi(name: TamagotchiName.preparing.rawValue, image: TamagotchiImage.preparing.rawValue),
        SelectTamagotchi(name: TamagotchiName.preparing.rawValue, image: TamagotchiImage.preparing.rawValue),
        SelectTamagotchi(name: TamagotchiName.preparing.rawValue, image: TamagotchiImage.preparing.rawValue),
        SelectTamagotchi(name: TamagotchiName.preparing.rawValue, image: TamagotchiImage.preparing.rawValue)
    ]
}
