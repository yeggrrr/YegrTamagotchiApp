//
//  UserDefaultsInfo.swift
//  YegrTamagotchiApp
//
//  Created by YJ on 6/22/24.
//

import Foundation

enum UserDefaultsInfo: String {
    case isExistUser
    case nickname
    case feedCount
    case waterCount
    case kind
}

struct UserDefaultsData {
    static var isExistUser: Bool {
        UserDefaults.standard.bool(forKey: UserDefaultsInfo.isExistUser.rawValue)
    }
    
    static var nickname: String {
        UserDefaults.standard.string(forKey: UserDefaultsInfo.nickname.rawValue) ?? "대장"
    }
    static var feedCount: Int {
        UserDefaults.standard.integer(forKey: UserDefaultsInfo.feedCount.rawValue)
    }
    static var waterCount: Int {
        UserDefaults.standard.integer(forKey: UserDefaultsInfo.waterCount.rawValue)
    }
    static var kind: String {
        UserDefaults.standard.string(forKey: UserDefaultsInfo.kind.rawValue) ?? "-"
    }
    
    static var level: Int {
        let result = ((feedCount / 5) + (waterCount / 2)) / 10
        if result == 0 { return 1 }
        if result > 10 { return 10 }
        return result
    }
    
    static var imageName: String {
        let kindType = TamagotchiInfo.Kind(rawValue: kind) ?? .preparing
        
        if kindType == .preparing {
            return kind
        }
        
        if level >= 10 {
            return "\(kind)-9"
        }
        
        return "\(kind)-\(level)"
    }
    
    static var thumbnailImageName: String {
        let kindType = TamagotchiInfo.Kind(rawValue: kind) ?? .preparing
        
        if kindType == .preparing {
            return kind
        }
        
        return "\(kind)-6"
    }
    
    static var tamagotchiName: String {
        for tamagotchiInfo in TamagotchiData.raisingTamagotchi {
            if tamagotchiInfo.kind.rawValue == UserDefaultsData.kind {
                return tamagotchiInfo.name.rawValue
            }
        }
        
        return "-"
    }
}
