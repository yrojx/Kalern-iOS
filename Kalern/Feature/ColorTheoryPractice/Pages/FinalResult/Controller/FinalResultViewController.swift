//
//  FinalResultViewController.swift
//  Kalern
//
//  Created by Michael Tanakoman on 21/06/21.
//

import UIKit

class FinalResultViewController: UIViewController {

    @IBOutlet weak var btnBackToStart: UIButton!
    
    @IBOutlet var colorPaletteView: [ColorDotView]!
    @IBOutlet weak var imageResult: UIImageView!
    @IBOutlet weak var titleFinalResult: UILabel!
    @IBOutlet weak var descFinalResult: UILabel!
    
    @IBOutlet weak var stackViewFailed: UIStackView!
    @IBOutlet weak var btnBacktoStartFailed: UIButton!
    @IBOutlet weak var btnTryAgainFailed: UIButton!
    
    @IBOutlet var labelPercentage: [UILabel]!
    
    let repository = ColorTheoryPracticeRepository.shared
    
    let trueColorBalancePercentage = [60, 30, 10]
    
    let finalResult = FinalResult.getFinalResultData()
    
    var imageFinalResult: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageResult.image = imageFinalResult
        
        repository.modifiedColorPallete?.initColorPalleteView(colorDotViews: colorPaletteView)
        
        checkResult()
    }
    
    func checkResult(){
        if repository.colorBalancePercentage == trueColorBalancePercentage{
            stackViewFailed.isHidden = true
            btnBackToStart.isHidden = false
            titleFinalResult.text = finalResult[0].titleFinalResult
            descFinalResult.text = finalResult[0].descFinalResult
        }else{
            stackViewFailed.isHidden = false
            btnBackToStart.isHidden = true
            titleFinalResult.text = finalResult[1].titleFinalResult
            descFinalResult.text = finalResult[1].descFinalResult
        }
    }
    
    @IBAction func btnBackToStartTapped(_ sender: Any) {
        repository.dispose()
        
        performSegue(withIdentifier: "goBackToHome", sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        btnBackToStart.layer.cornerRadius = 10
        
        imageResult.layer.borderWidth = 1
        imageResult.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        imageResult.layer.cornerRadius = 10
        
        btnBacktoStartFailed.layer.cornerRadius = 10
        
        btnTryAgainFailed.layer.cornerRadius = 10
        btnTryAgainFailed.layer.borderColor = #colorLiteral(red: 1, green: 0.3600544035, blue: 0, alpha: 1)
        btnTryAgainFailed.layer.borderWidth = 1
        
        self.navigationItem.title = "Assessment Result"
        
        labelPercentage[1].text = "Hello"
        
        for (idx, labelPercentage) in labelPercentage.enumerated(){
            labelPercentage.text = "\(repository.colorBalancePercentage[idx])%"
        }
    }
}
