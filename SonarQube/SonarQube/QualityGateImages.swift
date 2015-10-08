//
//  QualityGateImages.swift
//  SonarQube
//
//  Created by Elena Vilchik on 08/10/15.
//  Copyright © 2015 SonarSource. All rights reserved.
//

import Foundation
import UIKit

class QualityGateImages {
    
    static let qgImageOk = UIImage(named: "QualityGateOk")!
    static let qgImageError = UIImage(named: "QualityGateError")!
    static let qgImageWarn = UIImage(named: "QualityGateWarn")!
    
    static func image(qualityGate: SonarProject.QualityGate)-> UIImage {
        switch qualityGate {
        case .orange:
            return qgImageWarn
        case .red:
            return qgImageError
        case .green:
            return qgImageOk
        }
    }
}