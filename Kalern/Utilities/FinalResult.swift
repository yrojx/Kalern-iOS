//
//  FinalResult.swift
//  Kalern
//
//  Created by Michael Tanakoman on 21/06/21.
//

import UIKit

struct FinalResult{
    var titleFinalResult: String
    var descFinalResult: String
    
    static func getFinalResultData() -> [FinalResult] {
        var data: [FinalResult] = []
        
        data.append(FinalResult(titleFinalResult: "Your Design is Balanced", descFinalResult: "Excellent job! Good design should at least have 60/30/10 ratio."))
        
        data.append(FinalResult(titleFinalResult: "Your Design isn't Balanced", descFinalResult: "Good design should at least have 60/30/10 ratio. Here are the color balance ratio of your design:"))
        
        return data
    }
}
