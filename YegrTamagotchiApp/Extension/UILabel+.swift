//
//  UILabel+.swift
//  YegrTamagotchiApp
//
//  Created by YJ on 6/8/24.
//

import UIKit

extension UILabel {
    func setMainLabel(textContents: String, fontSizeStyle: UIFont) {
        text = textContents
        textColor = UIColor.fontBorderColor()
        textAlignment = .center
        font = fontSizeStyle
    }
}
