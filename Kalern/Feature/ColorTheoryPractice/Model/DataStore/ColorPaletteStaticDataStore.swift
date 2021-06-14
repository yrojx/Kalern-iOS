//
//  ColorPaletteStaticDataStore.swift
//  Kalern
//
//  Created by Akbar Priyonggo on 14/06/21.
//

import Foundation

struct ColorPaletteStaticDataStore {
    func initColorPalette() -> ColorPallete {
        return ColorPallete(colors: ColorPaletteStatic.colors)
    }
}
