//
//  ColorPallete.swift
//  Kalern
//
//  Created by Yossan Sandi Rahmadi on 12/06/21.
//

import UIKit

struct ColorPallete {
    var colors = [UIColor]()
    
    func initColorPalleteView(colorDotViews: [ColorDotView]) {
        for (idx, color) in colors.enumerated() {
            colorDotViews[idx].colorDot = ColorDot(id: idx, color: color)
        }
    }
    
    func setColorPalleteBorder(activeIndex: Int, colorPalleteVeiw: [ColorDotView]) {
        for (idx, colorDot) in colorPalleteVeiw.enumerated() {
            if idx == activeIndex {
                colorDot.colorDotView.layer.borderWidth = 5
            } else {
                colorDot.colorDotView.layer.borderWidth = 0
            }
        }
    }
}
