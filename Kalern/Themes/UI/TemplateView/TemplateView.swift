//
//  TemplateView.swift
//  Kalern
//
//  Created by Yossan Sandi Rahmadi on 19/06/21.
//

import UIKit

class TemplateView: UIView {
    @IBOutlet weak var templateView: UIView!
    @IBOutlet weak var noteLabel: UILabel!
    
    var activeObjectviewIndex = 0
    
    var showObjectFlag = false
    
    var objectTemplate: [ObjectTemplate] = [
        ObjectTemplate(objectTemplateType: .primary, objectUIViewType: .basicView),
        ObjectTemplate(objectTemplateType: .secondary, objectUIViewType: .basicView),
        ObjectTemplate(objectTemplateType: .secondary, objectUIViewType: .basicView),
        ObjectTemplate(objectTemplateType: .secondary, objectUIViewType: .basicView),
        ObjectTemplate(objectTemplateType: .secondary, objectUIViewType: .basicView),
        ObjectTemplate(objectTemplateType: .secondary, objectUIViewType: .basicView),
        ObjectTemplate(objectTemplateType: .secondary, objectUIViewType: .image),
        ObjectTemplate(objectTemplateType: .accent, objectUIViewType: .image),
        ObjectTemplate(objectTemplateType: .accent, objectUIViewType: .text),
        ObjectTemplate(objectTemplateType: .accent, objectUIViewType: .image)
    ]
    
    @IBOutlet var objectViews: [UIView]!
    @IBOutlet var objectHelperViews: [UIView]!
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
        
        for view in viewBackgroundImage{
            view.layer.cornerRadius = 10
        }
        
        for objectView in objectViews {
            objectView.addGestureRecognizer(setObjectViewGesture())
        }
        
        for objectHelperView in objectHelperViews {
            objectHelperView.addGestureRecognizer(setObjectViewGesture())
        }
        
        self.addSubview(templateView)
    }
    
    func setObjectViewGesture() -> UITapGestureRecognizer {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        
        return tapRecognizer
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        activeObjectviewIndex = sender?.view?.tag ?? 0
        showObjectFlag = false
        setObjectsViewBorder()
    }
    
    func setObjectsViewBorder() {
        for (idx, objectView) in objectViews.enumerated() {
            if idx == activeObjectviewIndex {
                objectView.layer.borderWidth = 5
                objectView.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            } else {
                objectView.layer.borderWidth = 0
            }
        }
    }
}
