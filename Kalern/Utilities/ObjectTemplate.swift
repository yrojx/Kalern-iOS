//
//  ObjectTemplate.swift
//  Kalern
//
//  Created by Yossan Sandi Rahmadi on 19/06/21.
//

import Foundation

struct ObjectTemplate {
    let objectTemplateType: ObjectTemplateType
    let objectUIViewType: ObjectUIViewType
}

enum ObjectTemplateType {
    case primary
    case secondary
    case accent
    
    func getScore() -> Int {
        switch self {
            case .primary:
                return 60
                
            case .secondary:
                return 5
                
            case .accent:
                return 3
        }
    }
}

enum ObjectUIViewType {
    case image
    case text
    case basicView
}
