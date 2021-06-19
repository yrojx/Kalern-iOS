//
//  HueAssesmentViewController.swift
//  Kalern
//
//  Created by Michael Tanakoman on 14/06/21.
//

import UIKit

class HueAssesmentViewController: UIViewController {

    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var colorWheelView: ColorWheelView!
    @IBOutlet var colorPalleteView: [ColorDotView]!
    @IBOutlet weak var assesmentImageView: UIImageView!
    @IBOutlet weak var colorHueTheoryTitleLabel: UILabel!
    @IBOutlet weak var colorPalleteContainer: UIView!
    
    var index: Int = 0
    
    var defaultColorPallete = UIColor(red: 227, green: 228, blue: 230, alpha: 1)
    
    let repository = ColorTheoryPracticeRepository.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorWheelView.delegate = self
        
        for (idx, colorDotView) in colorWheelView.colorDotViews.enumerated() {
            colorDotView.colorDot = ColorDot(id: idx, color: ColorWheel.colors[idx] ?? .red)
        }
        
        for (idx, colorDotView) in colorPalleteView.enumerated() {
            colorDotView.tag = idx
            colorDotView.addGestureRecognizer(setColorPalleteGesture())
        }
        
        colorHueTheoryTitleLabel.text = repository.pickedColorHueTheory?.type.rawValue
        
        repository.colorPallete?.initColorPalleteView(colorDotViews: colorPalleteView)
        
        repository.colorPallete?.setColorPalleteBorder(activeIndex: index, colorPalleteVeiw: colorPalleteView)
    
    }
    
    func setColorPalleteGesture() -> UITapGestureRecognizer {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        
        return tapRecognizer
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        index = sender?.view?.tag ?? 0
        repository.colorPallete?.setColorPalleteBorder(activeIndex: index, colorPalleteVeiw: colorPalleteView)
    }
    
    @IBAction func btnNextTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "goToColorPalette", sender: self)
    }

    override func viewWillAppear(_ animated: Bool) {
        btnNext.layer.cornerRadius = 10
        
        colorPalleteContainer.layer.cornerRadius = 10
        
        colorPalleteContainer.layer.borderColor = #colorLiteral(red: 0.9864340425, green: 0.3019824326, blue: 0, alpha: 1)
        colorPalleteContainer.layer.borderWidth = 1
        
        self.navigationItem.title = "Hue Practice"
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    }
    
    func assesColorTheory() {
        var isFilledAll = true
        for colorDotView in colorPalleteView {
            if colorDotView.colorDot?.color == repository.defaultColorPallete {
                isFilledAll = false
            }
        }
        
        if isFilledAll {
            checkColorTheory()
        }
    }
    
    private func checkColorTheory() {
        var flag = false
        var pickedColorPair = [Int]()
        
        // tambah satu karena di db index mulai dari 1
        for colorDot in colorPalleteView {
            guard let colorDotId = colorDot.colorDot?.id else {
                return
            }
            pickedColorPair.append(colorDotId + 1)
        }
        
        pickedColorPair.sort()
        
        if let colorPairs = repository.pickedColorHueTheory?.colorPairs {
            for colorPair in colorPairs {
                if colorPair == pickedColorPair {
                    flag = true
                    break
                }
            }
        }
        if flag {
            btnNext.alpha = 1
            btnNext.isEnabled = true
            assesmentImageView.image = UIImage(systemName: "checkmark.circle.fill")
            assesmentImageView.tintColor = #colorLiteral(red: 0, green: 0.5764705882, blue: 0, alpha: 1)
        } else {
            assesmentImageView.image = UIImage(systemName: "x.circle.fill")
            assesmentImageView.tintColor = #colorLiteral(red: 0.9921568627, green: 0.3254901961, blue: 0.03137254902, alpha: 1)
        }
    }
    
}

extension HueAssesmentViewController: ColorWheelViewDelegate {
    func colorDotView(id: Int, color: UIColor) {
        if index >= 0 && index <= 2 {
            colorPalleteView[index].colorDot? = ColorDot(id: id, color: color)
            repository.editColorInPallete(colorIndex: index, color: color)
            
            index += 1
            
            repository.colorPallete?.setColorPalleteBorder(activeIndex: index, colorPalleteVeiw: colorPalleteView)
            
            assesColorTheory()
        }
    }
}
