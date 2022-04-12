//
//  Extensions.swift
//  SleepClone
//
//  Created by Justin on 1/5/22.
//

import Foundation
import UIKit

extension UIView {
    func addRoundedCorners(withBorder: Bool = true, andCornerRadius: CGFloat = 8.0) {
        layer.cornerRadius = andCornerRadius
        layer.masksToBounds = true
        layer.borderWidth = withBorder ? 2.0 : 0.0
        layer.borderColor = UIColor.white.withAlphaComponent(0.3).cgColor
    }
}

extension UISegmentedControl
{
    func defaultConfiguration(font: UIFont = UIFont.systemFont(ofSize: 12), color: UIColor = UIColor.white)
    {
        let defaultAttributes = [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: color
        ]
        setTitleTextAttributes(defaultAttributes, for: .normal)
    }

    func selectedConfiguration(font: UIFont = UIFont.boldSystemFont(ofSize: 12), color: UIColor = UIColor.red)
    {
        let selectedAttributes = [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: color
        ]
        setTitleTextAttributes(selectedAttributes, for: .selected)
    }
}
