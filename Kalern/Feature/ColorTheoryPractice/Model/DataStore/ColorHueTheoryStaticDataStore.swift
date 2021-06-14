//
//  ColorHueTheoryStaticDataStore.swift
//  Kalern
//
//  Created by Akbar Priyonggo on 14/06/21.
//

import Foundation

struct ColorHueTheoryStaticDataStore {
    
    func initColorHueTheory() -> [ColorHueTheory] {
        var arrColorTheory = [ColorHueTheory]()
        
        let triadic = ColorHueTheory(type: .triadic,
                                     colorPairs: [[1, 5, 9],
                                                  [2, 6, 10],
                                                  [3, 7, 11],
                                                  [4, 8, 12]],
                                     description: "Evenly spaced colors around the color wheel. Triadic color harmonies tend to be quite vibrant, even if you use pale or unsaturated versions of your hues")
        
        let analogous = ColorHueTheory(type: .analogous,
                                       colorPairs: [[1, 2, 3],
                                                    [2, 3, 4],
                                                    [3, 4, 5],
                                                    [4, 5, 6],
                                                    [5, 6, 7],
                                                    [6, 7, 8],
                                                    [7, 8, 9],
                                                    [8, 9, 10],
                                                    [9, 10, 11],
                                                    [10, 11, 12],
                                                    [1, 11, 12],
                                                    [1, 2, 12]],
                                       description: "Colors that are next to each other on the color wheel. Analogous color schemes are often found in nature and are harmonious and pleasing to the eye")
        
        let splitComplementary = ColorHueTheory(type: .splitComplementary,
                                                colorPairs: [[1, 6, 8],
                                                             [2, 7, 9],
                                                             [3, 8, 10],
                                                             [4, 9, 11],
                                                             [5, 10, 12],
                                                             [1, 6, 11],
                                                             [2, 7, 12],
                                                             [1, 3, 8],
                                                             [2, 4, 9],
                                                             [3, 5, 10],
                                                             [4, 6, 11],
                                                             [5, 7, 12]],
                                                description: " The split complementary color scheme is a variation of the complementary color scheme. Start with one color, find its complement and then use the two colors on either side of it.")
        
        arrColorTheory.append(triadic)
        arrColorTheory.append(analogous)
        arrColorTheory.append(splitComplementary)
        
        return arrColorTheory
    }
    
}
