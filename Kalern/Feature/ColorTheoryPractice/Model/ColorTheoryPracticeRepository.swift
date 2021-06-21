//
//  ColorTheoryPracticeRepository.swift
//  Kalern
//
//  Created by Yossan Sandi Rahmadi on 14/06/21.
//

import UIKit

class ColorTheoryPracticeRepository {
    var colorPallete: ColorPallete?
    var modifiedColorPallete: ColorPallete?
    var pickedColorHueTheory: ColorHueTheory?
    var colorHueTheories: [ColorHueTheory]
    var shades = [[UIColor]]()
    var tints = [[UIColor]]()
    var defaultColorPallete = UIColor(red: CGFloat(227) / 255, green: CGFloat(228) / 255, blue: CGFloat(230) / 255, alpha: 1)
    var colorBalancePercentage = [0, 0, 1]
    
    static let shared = ColorTheoryPracticeRepository(colorHueTheoryStaticDataStore: ColorHueTheoryStaticDataStore())
    
    init(colorHueTheoryStaticDataStore: ColorHueTheoryStaticDataStore) {
        colorHueTheories = colorHueTheoryStaticDataStore.initColorHueTheory()
        for _ in 0...2 {
            colorPallete?.colors.append(defaultColorPallete)
        }
        
        // experiment dummy data
//        pickedColorHueTheory = colorHueTheories[0]
//        modifiedColorPallete = ColorPallete(colors: [#colorLiteral(red: 0.2392156863, green: 0.003921568627, blue: 0.6431372549, alpha: 1), #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)])
        
        colorPallete = ColorPallete(colors: [defaultColorPallete, defaultColorPallete, defaultColorPallete])
    }
    
    func dispose() {
        colorPallete = nil
        modifiedColorPallete = nil
        pickedColorHueTheory = nil
        
        for i in 0...2 {
            colorPallete?.colors[i] = defaultColorPallete
        }
        
        shades = [[UIColor]]()
        tints = [[UIColor]]()
        colorBalancePercentage = [0, 0, 1]
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
    
    func initShadesAndTint() {
        var rgbColorPallete = [[Int]]()
        
        guard let safeColorPallete = modifiedColorPallete else { return }
        
        for colorHue in safeColorPallete.colors {
            rgbColorPallete.append(colorHue.getRGB().4)
        }
        
        generateShades(with: rgbColorPallete)
        generateTint(with: rgbColorPallete)
    }
    
    private func generateShades(with rgbColorPallete: [[Int]]) {
        
        var factor: Double
        
        shades.removeAll()
        
        for (idx, rgbColorHue) in rgbColorPallete.enumerated() {
            
            factor = 0.8
            
            shades.append([])
            
            for _ in 0...4 {
                var tempRGBShades = [Int]()
                tempRGBShades = rgbColorHue.map({ (value) -> Int in
                    if Int(Double(value) * factor) >= 0 {
                        return Int(Double(value) * factor)
                    } else {
                        return 0
                    }
                })
                
                shades[idx].append(UIColor(red: CGFloat(tempRGBShades[0]) / 255.0, green: CGFloat(tempRGBShades[1]) / 255.0, blue: CGFloat(tempRGBShades[2]) / 255.0, alpha: 1.0))
                
                tempRGBShades.removeAll()
                
                factor -= 0.1
            }
            
        }
    }
    
    private func generateTint(with rgbColorPallete: [[Int]]) {
        
        var factor: Double
        
        tints.removeAll()
        
        for (idx, rgbColorHue) in rgbColorPallete.enumerated() {
            
            factor = 0.4
            
            tints.append([])
            
            for _ in 0...3 {
                var tempRGBTint = [Int]()
                tempRGBTint = rgbColorHue.map({ (value) -> Int in
                    if Int(Double(value) + ((Double(255 - value)) * factor)) <= 255 {
                        return Int(Double(value) + ((Double(255 - value)) * factor))
                    } else {
                        return 255
                    }
                })
                
                tints[idx].append(UIColor(red: CGFloat(tempRGBTint[0]) / 255.0, green: CGFloat(tempRGBTint[1]) / 255.0, blue: CGFloat(tempRGBTint[2]) / 255.0, alpha: 1.0))
                
                factor = factor + 0.15
            }
            
            tints[idx].insert(UIColor(red: CGFloat(rgbColorHue[0]) / 255.0, green: CGFloat(rgbColorHue[1]) / 255.0, blue: CGFloat(rgbColorHue[2]) / 255.0, alpha: 1.0), at: 0)
            
//            tints[idx].reverse()
        }
        
    }
}
