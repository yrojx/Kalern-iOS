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
    @IBOutlet var viewBackgroundImage: [UIView]!
    
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
        
        objectViews[7].layer.borderWidth = 5
        objectViews[7].layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        print(objectViews[7].tag)
        
        for view in viewBackgroundImage{
            view.layer.cornerRadius = 10
        }
        
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
