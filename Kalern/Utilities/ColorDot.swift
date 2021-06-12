//
//  ColorDot.swift
//  Kalern
//
//  Created by Yossan Sandi Rahmadi on 12/06/21.
//

import UIKit

struct ColorDot {
    let color: UIColor
}

struct ColorWheel {
    var id: Int
    var colors: [ColorDot]
}

struct BorderedColorDot {
    var isBordered: Bool
    var borderColor: UIColor
    let InteractiveColorDot: ColorDot
}
