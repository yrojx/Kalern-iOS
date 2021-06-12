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
                return UIImage()
                
            case .analogous:
                return UIImage()
                
            case .splitComplementary:
                return UIImage()
        }
    }
}

struct ColorHueTheory {
    var type: ColorHueTheoryType
    let colorPairs: [[Int]]
    var description: String
}
