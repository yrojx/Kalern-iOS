//
//  TemplateView.swift
//  Kalern
//
//  Created by Yossan Sandi Rahmadi on 19/06/21.
//

import UIKit

class TemplateView: UIView {
    @IBOutlet weak var templateView: UIView!
    
    var activeObjectviewIndex = 0
    
    let objectTemplate: [ObjectTemplate] = [
        ObjectTemplate(objectTemplateType: .primary),
        ObjectTemplate(objectTemplateType: .secondary),
        ObjectTemplate(objectTemplateType: .secondary),
        ObjectTemplate(objectTemplateType: .secondary),
        ObjectTemplate(objectTemplateType: .secondary),
        ObjectTemplate(objectTemplateType: .secondary),
        ObjectTemplate(objectTemplateType: .secondary),
        ObjectTemplate(objectTemplateType: .accent),
        ObjectTemplate(objectTemplateType: .accent),
        ObjectTemplate(objectTemplateType: .accent)
    ]
    
    @IBOutlet var objectViews: [UIView]!
    
    let nibName = "TemplateView"
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit() {
        templateView = self.loadViewFromNib(nibName: nibName)
        templateView.frame = self.bounds
        
        self.addSubview(templateView)
    }
    
    
    func setObjectViewGesture() -> UITapGestureRecognizer {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        
        return tapRecognizer
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        activeObjectviewIndex = sender?.view?.tag ?? 0
    }
}
