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
    var objectColorHierarchy: ObjectColorHierarchy?
}

enum ObjectTemplateType {
    case primary
    case secondary
    case accent
    
    func getScore() -> Float {
        switch self {
            case .primary:
                return 60.0
                
            case .secondary:
                return 5.0
                
            case .accent:
                return 3.3
        }
    }
}

enum ObjectUIViewType {
    case image
    case text
    case basicView
}

enum ObjectColorHierarchy {
    case primary
    case secondary
    case accent
}
