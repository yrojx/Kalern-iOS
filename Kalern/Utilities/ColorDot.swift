//
//  ColorDot.swift
//  Kalern
//
//  Created by Yossan Sandi Rahmadi on 12/06/21.
//

import UIKit

struct ColorDot {
    let id: Int
    var color: UIColor
}

struct BorderedColorDot {
    var isBordered: Bool
    var borderColor: UIColor
    let InteractiveColorDot: ColorDot
}
