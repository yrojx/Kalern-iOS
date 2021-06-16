//
//  ColorDotView.swift
//  Kalern
//
//  Created by Yossan Sandi Rahmadi on 13/06/21.
//

import UIKit

@IBDesignable

class ColorDotView: UIView {

    @IBOutlet var colorDotView: UIView!
    
    let nibName = "ColorDotView"
    
    var colorDot: ColorDot? {
        didSet {
            guard let color = colorDot?.color else {
                return colorDotView.backgroundColor = .red
            }
            print(color)
            colorDotView.backgroundColor = color
        }
    }
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit() {
        colorDotView = self.loadViewFromNib(nibName: nibName)
        colorDotView.frame = self.bounds
        
        // Make it circle
        colorDotView.layer.cornerRadius = min(self.frame.size.height, self.frame.size.width) / 2.0
        colorDotView.clipsToBounds = true
    
        colorDotView.layer.borderColor = UIColor.systemBlue.cgColor

        self.addSubview(colorDotView)
    }
    

}
