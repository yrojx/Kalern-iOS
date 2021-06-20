//
//  TemplateViewController+colorBalanceAssessment.swift
//  Kalern
//
//  Created by Akbar Priyonggo on 19/06/21.
//

import Foundation

extension TemplateViewController {
    
    func colorBalanceAssessment() {
        for (index, _) in templateView.objectViews.enumerated() {
            switch templateView.objectTemplate[index].objectColorHierarchy {
            case .primary:
                repository.colorBalancePercentage[0] += templateView.objectTemplate[index].objectTemplateType.getScore()
                break
            case .secondary:
                repository.colorBalancePercentage[1] += templateView.objectTemplate[index].objectTemplateType.getScore()
                break
            case .accent:
                repository.colorBalancePercentage[2] += templateView.objectTemplate[index].objectTemplateType.getScore()
                break
            
            case .none:
                break
            }
        }
    }
    
    
}


