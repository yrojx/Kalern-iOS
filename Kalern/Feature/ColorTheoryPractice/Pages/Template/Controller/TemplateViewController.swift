//
//  TemplateViewController.swift
//  Kalern
//
//  Created by Michael Tanakoman on 14/06/21.
//

import UIKit

class TemplateViewController: UIViewController {
    
    @IBOutlet weak var templateView: TemplateView!
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var btnShowObject: UIButton!
    @IBOutlet var colorPaletteView: [ColorDotView]!
    
    let repository = ColorTheoryPracticeRepository.shared
    
    var imageViewTemplate: UIImage?
    
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        repository.modifiedColorPallete?.initColorPalleteView(colorDotViews: colorPaletteView)
        
        for colorDot in colorPaletteView {
            colorDot.addGestureRecognizer(setColorPalleteGesture())
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        templateView.layer.cornerRadius = 10
        templateView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        templateView.layer.borderWidth = 2
        
        viewBackground.layer.cornerRadius = 10
        viewBackground.layer.borderWidth = 1
        viewBackground.layer.borderColor = #colorLiteral(red: 0.9864340425, green: 0.3019824326, blue: 0, alpha: 1)
        
        btnShowObject.layer.cornerRadius = 10
        
        self.navigationItem.title = "UI Color Practice"
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(handleDone(sender:)))
        navigationItem.rightBarButtonItem?.isEnabled = false
    }
    
    func setColorPalleteGesture() -> UITapGestureRecognizer {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        
        return tapRecognizer
    }
    
    @objc func handleDone(sender: UIBarButtonItem) {
        colorBalanceAssessment()
        imageViewTemplate = UIImage(view: templateView)
        performSegue(withIdentifier: "goToFinalResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! FinalResultViewController
        vc.imageFinalResult = self.imageViewTemplate
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        index = sender?.view?.tag ?? 0
        
        if templateView.activeObjectviewIndex == 9 {
            let objectView = templateView.objectViews[templateView.activeObjectviewIndex].superview?.superview?.subviews[1] as? UILabel
            objectView?.textColor = repository.modifiedColorPallete?.colors[index]
        }
        
        switch index {
            case 0:
                templateView.objectTemplate[templateView.activeObjectviewIndex].objectColorHierarchy = .primary
                break
            
            case 1:
                templateView.objectTemplate[templateView.activeObjectviewIndex].objectColorHierarchy = .secondary
                break
                
            case 2:
                templateView.objectTemplate[templateView.activeObjectviewIndex].objectColorHierarchy = .accent
                break
                
            default:
                break
        }
        
        switch templateView.objectTemplate[templateView.activeObjectviewIndex].objectUIViewType {
            case .basicView:
                templateView.objectViews[templateView.activeObjectviewIndex].backgroundColor = repository.modifiedColorPallete?.colors[index]
                break
                
            case .image:
                templateView.objectViews[templateView.activeObjectviewIndex].tintColor = repository.modifiedColorPallete?.colors[index]
                break
                
            case .text:
                let objectView = templateView.objectViews[templateView.activeObjectviewIndex] as? UILabel
                objectView?.textColor = repository.modifiedColorPallete?.colors[index]
                break
        }
        
        checkObjectViewsCompletition()
    }
    
    private func checkObjectViewsCompletition() {
        var flag = true
        for objectTemplate in templateView.objectTemplate {
            if objectTemplate.objectColorHierarchy == nil {
                flag = false
                break
            }
        }
        
        if flag {
            navigationItem.rightBarButtonItem?.isEnabled = true
        }
    }
    
    @IBAction func showObjectBtnTapped(_ sender: UIButton) {
        if templateView.showObjectFlag {
            for objectView in templateView.objectViews {
                objectView.layer.borderWidth = 0
            }
        } else {
            for objectView in templateView.objectViews {
                objectView.layer.borderWidth = 5
                objectView.layer.borderColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            }
        }
        templateView.showObjectFlag = !templateView.showObjectFlag
    }
}
