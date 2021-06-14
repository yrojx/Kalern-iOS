//
//  ColorDotView.swift
//  Kalern
//
//  Created by Yossan Sandi Rahmadi on 13/06/21.
//

import UIKit

@IBDesignable

class ColorWheelView: UIView {
    
    @IBOutlet var colorWheelView: UIView!
    @IBOutlet var colorDotViews: [ColorDotView]!
    
    let nibName = "ColorWheelView"
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit() {
        colorWheelView = self.loadViewFromNib(nibName: nibName)
        colorWheelView.frame = self.bounds
        
        self.addSubview(colorWheelView)
    }

}
