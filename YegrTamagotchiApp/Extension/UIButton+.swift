//
//  UIButton+.swift
//  YegrTamagotchiApp
//
//  Created by YJ on 6/8/24.
//

import UIKit

extension UIButton {
    func setDetailUI(detailBackgroundColor: UIColor, buttonTitle: String, buttonTitleColor: UIColor) {
        backgroundColor = detailBackgroundColor
        setTitle(buttonTitle, for: .normal)
        setTitleColor(buttonTitleColor, for: .normal)
    }
    
    func setMainUI(imageSystemName: String, buttonTitle: String) {
        layer.borderWidth = 1
        layer.borderColor = UIColor.fontBorderColor.cgColor
        layer.cornerRadius = 10
        setImage(UIImage(systemName: imageSystemName), for: .normal)
        setTitle(buttonTitle, for: .normal)
        tintColor = .fontBorderColor
        setTitleColor(.fontBorderColor, for: .normal)
    }
}
