//
//  ColorDotView.swift
//  Kalern
//
//  Created by Yossan Sandi Rahmadi on 13/06/21.
//

import UIKit

protocol ColorWheelViewDelegate {
    func colorDotView(id: Int, color: UIColor)
}

@IBDesignable

class ColorWheelView: UIView {
    
    @IBOutlet var colorWheelView: UIView!
    @IBOutlet var colorDotViews: [ColorDotView]!
    
    var delegate: ColorWheelViewDelegate?
    
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
        
        for colorDotView in colorDotViews {
            colorDotView.addGestureRecognizer(setColorWheelGesture())
        }
        
        self.addSubview(colorWheelView)
    }
    
    func setColorWheelGesture() -> UITapGestureRecognizer {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        
        return tapRecognizer
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        delegate?.colorDotView(id: colorDotViews[sender?.view?.tag ?? 0].colorDot?.id ?? 0, color: colorDotViews[sender?.view?.tag ?? 0].colorDot?.color ?? .blue)
    }

    
}
