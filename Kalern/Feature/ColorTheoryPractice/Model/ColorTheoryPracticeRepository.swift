//
//  ColorTheoryPracticeRepository.swift
//  Kalern
//
//  Created by Yossan Sandi Rahmadi on 14/06/21.
//

import UIKit

class ColorTheoryPracticeRepository {
    var colorPallete: ColorPallete?
    var pickedColorHueTheory: ColorHueTheory?
    var colorHueTheories: [ColorHueTheory]
    
    static let shared = ColorTheoryPracticeRepository(colorHueTheoryStaticDataStore: ColorHueTheoryStaticDataStore())
    
    init(colorHueTheoryStaticDataStore: ColorHueTheoryStaticDataStore) {
        colorHueTheories = colorHueTheoryStaticDataStore.initColorHueTheory()
        pickedColorHueTheory = colorHueTheories[0]
    }
    
    func getColorPallete() -> ColorPallete {
        guard let safeColorPallete = colorPallete else { fatalError() }
        return safeColorPallete
    }
    
    func editColorInPallete(colorIndex: Int, color: UIColor) {
        colorPallete?.colors[colorIndex] = color
    }
    
    func useStaticColorPallete() {
        colorPallete = ColorPaletteStaticDataStore.initColorPalette()
    }
}
