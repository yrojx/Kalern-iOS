//
//  ColorHueAssessment.swift
//  Kalern
//
//  Created by Michael Tanakoman on 20/06/21.
//

import UIKit

struct ColorHueAssessment{
    var titleResult: String
    var descResult: String
    
    static func getResultData() -> [ColorHueAssessment]{
        var data: [ColorHueAssessment] = []
        
        data.append(ColorHueAssessment(titleResult: "Good Job", descResult: "Your palette is a split complimentary"))
        data.append(ColorHueAssessment(titleResult: "Try Again", descResult: "Your palette is not a split complimentary."))
        
        return data
    }
}
