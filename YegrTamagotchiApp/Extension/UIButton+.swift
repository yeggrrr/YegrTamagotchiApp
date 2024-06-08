//
//  UIButton+.swift
//  YegrTamagotchiApp
//
//  Created by YJ on 6/8/24.
//

import UIKit

extension UIButton {
    func setDetailUI(datilBackgroundColor: UIColor, buttonTitle: String, buttonTitleColor: UIColor) {
        backgroundColor = datilBackgroundColor
        setTitle(buttonTitle, for: .normal)
        setTitleColor(buttonTitleColor, for: .normal)
    }
}
