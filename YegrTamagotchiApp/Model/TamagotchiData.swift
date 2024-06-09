//
//  TamagotchiData.swift
//  YegrTamagotchiApp
//
//  Created by YJ on 6/8/24.
//

import UIKit

struct TamagotchiInfo {
    let name: Name
    let introduction: Introduction
    var kind: Kind
    
    enum Name: String {
        case cactus = "따끔따끔 다마고치"
        case sun = "방실방실 다마고치"
        case star = "반짝반짝 다마고치"
        case preparing = "준비중이에요"
    }
    
    enum Introduction: String {
        case catus = "저는 따끔따끔 다마고치입니당\n키는 10m 몸무게는 50kg이에용\n성격은 동글동글 날카롭답니다~!\n열심히 잘 먹고 잘 클 자신은 있답니당\n따끔따끔!"
        case sun = "저는 방실방실 다마고치입니당\n키는 100km 몸무게는 150톤이에용\n성격은 화끈하고 날라다닙니다~!\n열심히 잘 먹고 잘 클 자신은 있답니당\n방실방실!"
        case star = "저는 반짝반짝 다마고치입니당\n키는 10km 몸무게는 50톤이에용\n성격은 밝고 활기차답니다~!\n열심히 잘 먹고 잘 클 자신은 있답니당\n반짝반짝!"
        case preparing = "저는 누구일까요~?\n조금만 기다려주세요~!^0^"
    }
    
    enum Kind: String {
        case cactus = "1"
        case sun = "2"
        case star = "3"
        case preparing = "noImage"
    }
}

struct RaisingTamagotchi {
    var info: TamagotchiInfo
    var feedCount: Int = 0
    var waterDropCount: Int = 0
    
    var level: Int {
        let result = ((feedCount / 5) + ( waterDropCount / 2)) / 10
        if result == 0 { return 1 }
        if result > 10 { return 10 }
        return result
    }
    
    var imageName: String {
        let raw = info.kind.rawValue
        
        if info.kind == .preparing {
            return raw
        }
        
        if level >= 10 {
            return "\(raw)-9"
        }
        
        return "\(raw)-\(level)"
    }
    
    var thumbnailImageName: String {
        let raw = info.kind.rawValue
        
        if info.kind == .preparing {
            return raw
        }
        
        return "\(raw)-6"
    }
 }

struct UserInfo {
    static var nickname: String = "YEGR"
}

struct TamagotchiData {
    static var raisingTamagotchi: [RaisingTamagotchi] = {
        var arr = [RaisingTamagotchi].init(repeating: preparingRasingData, count: 17)
        arr.insert(contentsOf: [cactusRasingData, sunRasingData, starRasingData], at: 0)
        return arr
    }()
}

extension TamagotchiData {
    // SelectTamagotchi Model Data
    static var cactusSelectData = TamagotchiInfo(
        name: .cactus,
        introduction: .catus,
        kind: .cactus)
    static var sunSelectData = TamagotchiInfo(
        name: .sun,
        introduction: .sun,
        kind: .sun)
    static var starSelectData = TamagotchiInfo(
        name: .star,
        introduction: .star,
        kind: .star)
    static var preparingSelectData = TamagotchiInfo(
        name: .preparing,
        introduction: .preparing,
        kind: .preparing)
    
    // RaisingTamagotchi Model Data
    static var cactusRasingData = RaisingTamagotchi(info: cactusSelectData)
    static var sunRasingData = RaisingTamagotchi(info: sunSelectData)
    static var starRasingData = RaisingTamagotchi(info: starSelectData)
    static var preparingRasingData = RaisingTamagotchi(info: preparingSelectData)
}
