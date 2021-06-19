//
//  UIColor+getRGB.swift
//  Kalern
//
//  Created by Yossan Sandi Rahmadi on 13/06/21.
//

import UIKit

extension UIColor {
    func getRGB() -> (Int, Int, Int, Int, [Int]) {
        var fRed : CGFloat = 0
        var fGreen : CGFloat = 0
        var fBlue : CGFloat = 0
        var fAlpha: CGFloat = 0
        if self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha) {
            let iRed = Int(fRed * 255.0)
            let iGreen = Int(fGreen * 255.0)
            let iBlue = Int(fBlue * 255.0)
            let iAlpha = Int(fAlpha * 255.0)

            return (red: iRed, green: iGreen, blue: iBlue, alpha: iAlpha, [iRed, iGreen, iBlue])
        } else {
            return (0, 0, 0, 0, [])
        }
    }
}
