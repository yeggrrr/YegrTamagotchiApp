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

enum TamagotchiIntroduction: String {
    case catus = "저는 따끔따끔 다마고치입니당 \n키는 10m 몸무게는 50kg이에용 \n성격은 동글동글 날카롭답니다~! \n열심히 잘 먹고 잘 클 자신은 있답니당 \n따끔따끔!"
    case sun = "저는 방실방실 다마고치입니당 \n키는 100km 몸무게는 150톤이에용 \n성격은 화끈하고 날라다닙니다~! \n열심히 잘 먹고 잘 클 자신은 있답니당 \n방실방실!"
    case star = "저는 반짝반짝 다마고치입니당 \n키는 10km 몸무게는 50톤이에용 \n성격은 밝고 활기차답니다~! \n열심히 잘 먹고 잘 클 자신은 있답니당 \n반짝반짝!"
    case preparing = "저는 누구일까요~? \n조금만 기다려주세요~!^0^"
}

struct SelectTamagotchi {
    let name: TamagotchiName.RawValue
    let image: TamagotchiImage.RawValue
    let introduction: TamagotchiIntroduction.RawValue
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
        SelectTamagotchi(name: TamagotchiName.cactus.rawValue, image: TamagotchiImage.cactus.rawValue, introduction: TamagotchiIntroduction.catus.rawValue),
        SelectTamagotchi(name: TamagotchiName.sun.rawValue, image: TamagotchiImage.sun.rawValue, introduction: TamagotchiIntroduction.sun.rawValue),
        SelectTamagotchi(name: TamagotchiName.star.rawValue, image: TamagotchiImage.star.rawValue, introduction: TamagotchiIntroduction.star.rawValue),
        SelectTamagotchi(name: TamagotchiName.preparing.rawValue, image: TamagotchiImage.preparing.rawValue, introduction: TamagotchiIntroduction.preparing.rawValue),
        SelectTamagotchi(name: TamagotchiName.preparing.rawValue, image: TamagotchiImage.preparing.rawValue, introduction: TamagotchiIntroduction.preparing.rawValue),
        SelectTamagotchi(name: TamagotchiName.preparing.rawValue, image: TamagotchiImage.preparing.rawValue, introduction: TamagotchiIntroduction.preparing.rawValue),
        SelectTamagotchi(name: TamagotchiName.preparing.rawValue, image: TamagotchiImage.preparing.rawValue, introduction: TamagotchiIntroduction.preparing.rawValue),
        SelectTamagotchi(name: TamagotchiName.preparing.rawValue, image: TamagotchiImage.preparing.rawValue, introduction: TamagotchiIntroduction.preparing.rawValue),
        SelectTamagotchi(name: TamagotchiName.preparing.rawValue, image: TamagotchiImage.preparing.rawValue, introduction: TamagotchiIntroduction.preparing.rawValue),
        SelectTamagotchi(name: TamagotchiName.preparing.rawValue, image: TamagotchiImage.preparing.rawValue, introduction: TamagotchiIntroduction.preparing.rawValue),
        SelectTamagotchi(name: TamagotchiName.preparing.rawValue, image: TamagotchiImage.preparing.rawValue, introduction: TamagotchiIntroduction.preparing.rawValue),
        SelectTamagotchi(name: TamagotchiName.preparing.rawValue, image: TamagotchiImage.preparing.rawValue, introduction: TamagotchiIntroduction.preparing.rawValue),
        SelectTamagotchi(name: TamagotchiName.preparing.rawValue, image: TamagotchiImage.preparing.rawValue, introduction: TamagotchiIntroduction.preparing.rawValue),
        SelectTamagotchi(name: TamagotchiName.preparing.rawValue, image: TamagotchiImage.preparing.rawValue, introduction: TamagotchiIntroduction.preparing.rawValue),
        SelectTamagotchi(name: TamagotchiName.preparing.rawValue, image: TamagotchiImage.preparing.rawValue, introduction: TamagotchiIntroduction.preparing.rawValue),
        SelectTamagotchi(name: TamagotchiName.preparing.rawValue, image: TamagotchiImage.preparing.rawValue, introduction: TamagotchiIntroduction.preparing.rawValue),
        SelectTamagotchi(name: TamagotchiName.preparing.rawValue, image: TamagotchiImage.preparing.rawValue, introduction: TamagotchiIntroduction.preparing.rawValue),
        SelectTamagotchi(name: TamagotchiName.preparing.rawValue, image: TamagotchiImage.preparing.rawValue, introduction: TamagotchiIntroduction.preparing.rawValue),
        SelectTamagotchi(name: TamagotchiName.preparing.rawValue, image: TamagotchiImage.preparing.rawValue, introduction: TamagotchiIntroduction.preparing.rawValue),
        SelectTamagotchi(name: TamagotchiName.preparing.rawValue, image: TamagotchiImage.preparing.rawValue, introduction: TamagotchiIntroduction.preparing.rawValue)
    ]
}
