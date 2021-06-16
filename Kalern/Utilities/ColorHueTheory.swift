//
//  ColorHueTheory.swift
//  Kalern
//
//  Created by Yossan Sandi Rahmadi on 12/06/21.
//

import UIKit

enum ColorHueTheoryType: String, CaseIterable {
    case triadic = "Triadic"
    case analogous = "Analogous"
    case splitComplementary = "Split Complementary"
    
    func getImage() -> UIImage {
        switch self {
            case .triadic:
                return ColorTheoryImage.triadic ?? UIImage()
                
            case .analogous:
                return ColorTheoryImage.analogous ?? UIImage()
                
            case .splitComplementary:
                return ColorTheoryImage.splitComplementary ?? UIImage()
        }
    }
}

struct ColorHueTheory {
    var type: ColorHueTheoryType
    let colorPairs: [[Int]]
    var description: String
}
